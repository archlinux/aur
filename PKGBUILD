# Maintainer: Adrian Freund <adrian@freund.io>

pkgname=('python-spotpris2')
_module='SpotPRIS2'
pkgver='0.3.1'
pkgrel=1
pkgdesc="Control Spotify Connect devices using MPRIS2"
url="https://github.com/freundTech/SpotPRIS2"
depends=('python' 'python-pydbus' 'python-spotipy' 'python-appdirs' 'python-gobject' 'glib2')
makedepends=('python-setuptools')
license=('MIT')
arch=('any')
source=("https://github.com/freundTech/SpotPRIS2/archive/v${pkgver}.tar.gz")
sha256sums=('53fe40789ca649472874df35b27b915ba8ec89dde80609e98293e7d3ed2b4eb9')

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py build
}

package() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
