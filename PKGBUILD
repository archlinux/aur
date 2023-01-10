# Maintainer: Aleksy Grabowski <hurufu@gmail.com>

pkgname=python-timebudget-git
pkgver=0.7.r2.ge58b712
pkgrel=3
pkgdesc='A stupidly-simple tool to see where your time is going in Python programs'
arch=(any)
url='https://github.com/leopd/timebudget'
license=('Apache')

depends=(
    python
    licenses
)
makedepends=(
    git
    python-pip
)
provides=(
    python-timebudget
)
conflicts=(
    python-timebudget
)
source=('git+https://github.com/leopd/timebudget.git')
md5sums=('SKIP')

pkgver() {
    git -C "$srcdir/timebudget" describe | awk -F - '{ print substr($1,2)".r"$2"."$3 }'
}

build() {
    cd "${srcdir}/timebudget"
    python setup.py build
}

package() {
    cd "${srcdir}/timebudget"
    python setup.py install -O1 --root="$pkgdir" --skip-build
}
