# Maintainer: Aleksy Grabowski <hurufu@gmail.com>

pkgname=python-timebudget
pkgver=0.7
pkgrel=1
pkgdesc='A stupidly-simple tool to see where your time is going in Python programs'
arch=(any)
url='https://github.com/leopd/timebudget'
license=('Apache')

depends=(
    python
    licenses
)
makedepends=(
    python-pip
)
source=("$pkgname.tar.gz::https://github.com/leopd/timebudget/archive/v$pkgver.tar.gz")
md5sums=('SKIP')

build() {
    cd "${srcdir}/timebudget-$pkgver"
    python setup.py build
}

package() {
    cd "${srcdir}/timebudget-$pkgver"
    python setup.py install -O1 --root="$pkgdir" --skip-build
}
