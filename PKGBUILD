# Maintainer: Techmeology <techmeology@techmeology.co.uk>
# Fork of https://aur.archlinux.org/packages/cmake-lint/ to provide git version
pkgname=cmake-lint-git
pkgver=1.4.r3.g058c6c0
pkgrel=1
pkgdesc="Check for coding style issues in CMake files"
arch=('any')
url="http://github.com/richq/cmake-lint/"
license=('APACHE')
depends=('python')
makedepends=('python-setuptools')
conflicts=(cmake-lint)
provides=(cmake-lint)
source=('git+https://github.com/richq/cmake-lint.git')
sha512sums=(SKIP)

pkgver() {
  cd "$srcdir/cmake-lint"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/cmake-lint"
  python setup.py build
}

package() {
  cd "$srcdir/cmake-lint"
  python ./setup.py install --prefix=/usr --root="$pkgdir"
}
