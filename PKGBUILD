# Maintainer: Adrian Freund <adrian@freund.io>

pkgname=('python-spotpris2')
_module='SpotPRIS2'
pkgver='0.3'
pkgrel=2
pkgdesc="Control Spotify Connect devices using MPRIS2"
url="https://github.com/freundTech/SpotPRIS2"
depends=('python' 'python-pydbus' 'python-spotipy' 'python-appdirs' 'python-gobject' 'glib2')
makedepends=('python-setuptools')
license=('MIT')
arch=('any')
source=("https://github.com/freundTech/SpotPRIS2/archive/v${pkgver}.tar.gz")
sha256sums=('1bec6945ceadec348256c88d8690d3ddef95f985c1269a3ea00e7ef7974b48ed')

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py build
}

package() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
