# Maintainer: Michael Floßmann <michael.flossmann@uranus.uni-freiburg.de>
pkgname=cpplint-git
pkgver=1.4.4.r0.g4f2119f
_pkgver=1.4.4
pkgrel=1
pkgdesc="Command-line tool to check C/C++ files for style issues following Google's C++ style guide."
arch=('any')
url='https://github.com/cpplint/cpplint'
license=('custom')
depends=('python3')
makedepends=('git')
provides=('cpplint')
conflicts=('cpplint')
source=("$pkgname::git+https://github.com/cpplint/cpplint.git#tag=$_pkgver")
md5sums=('SKIP')

pkgver() {
    cd "$srcdir/$pkgname"
    git describe --long --tags | sed -E 's/([^-]*-g)/r\1/;s/-/./g'
}

build() {
    cd "$srcdir/$pkgname"

    python3 setup.py build
}

package() {
    cd "$srcdir/$pkgname"

    python3 setup.py install --root="$pkgdir/"
}

