# Maintainer: Simon Ser
pkgname=python-emailthreads-git
_pkgname=python-emailthreads
pkgver=0.1.3.r0.g99f1a04fa0dd
pkgrel=1
pkgdesc='Python library to parse and format email threads'
arch=(any)
url=https://github.com/emersion/$_pkgname
license=('MIT')
makedepends=(python-setuptools git)
provides=($_pkgname)
conflicts=($_pkgname)
source=($pkgname::git+https://github.com/emersion/$_pkgname)
sha256sums=('SKIP')

pkgver() {
  cd "$pkgname"
  git describe --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$pkgname"
  python setup.py build
}

package() {
  cd "$pkgname"
  python setup.py install --root=${pkgdir} --optimize=1
}
