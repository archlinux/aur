# Maintainer: Adrian Freund <adrian@freund.io>

pkgname=('python-spotpris2')
_module='SpotPRIS2'
pkgver='0.1'
pkgrel=1
pkgdesc="Control Spotify Connect devices using MPRIS2"
url="https://github.com/freundTech/SpotPRIS2"
depends=('python')
makedepends=('python-setuptools')
license=('MIT')
arch=('any')
source=("https://github.com/freundTech/SpotPRIS2/archive/v0.1.tar.gz")
sha256sums=('46f688d0bc1f6391164afa7c9e181145723cef9ddd6af6f7f3b35d9e61cf2283')

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py build
}

package() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
