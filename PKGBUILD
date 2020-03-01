# Maintainer: Adrian Freund <adrian@freund.io>

pkgname=('python-spotpris2')
_module='SpotPRIS2'
pkgver='0.2'
pkgrel=1
pkgdesc="Control Spotify Connect devices using MPRIS2"
url="https://github.com/freundTech/SpotPRIS2"
depends=('python')
makedepends=('python-setuptools')
license=('MIT')
arch=('any')
source=("https://github.com/freundTech/SpotPRIS2/archive/v${pkgver}.tar.gz")
sha256sums=('7aaf342b73d6715b8b7af35f574879e073ca7c01bba8b4fa84a47aa0cda2cb53')

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py build
}

package() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
