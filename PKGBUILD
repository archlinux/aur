# Maintainer: ahiiti <contact@stefan-braendle.de>

pkgname=at4
pkgver=0.0
pkgrel=1
pkgdesc="ahiiti's truly tremendous time tracker"
arch=('any')
url="https://gitlab.com/ahiiti/time-tracker"
license=('GPL3')
source=(
    "$pkgname::git+${url}.git#branch=devel-python-module"
)
sha512sums=(
    "SKIP"
)
makedepends=(
    'git'
)
depends=(
    'python'
    'python-jinja'
)
build() {
    cd "${srcdir}/${pkgname}"
    python setup.py build
}

package() {
    cd "${srcdir}/${pkgname}"
    python setup.py install --skip-build --prefix=/usr --root="${pkgdir}/"
}
