# Maintainer: Benjamin Winger <bmw@disroot.org>

pkgname=fasteners-git
pkgver=0.15.r34.g03e31bb
pkgrel=1
pkgdesc="A python package that provides useful locks."
provides=('fasteners')
conflicts=('fasteners')
arch=(any)
url="https://github.com/harlowja/fasteners"
license=(Apache)
depends=("python")
makedepends=("git" "python-setuptools")
source=("fasteners::git+${url}")
sha512sums=('SKIP')

pkgver() {
  cd "$srcdir/fasteners"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/fasteners"
  python setup.py build
}

package() {
  cd "$srcdir/fasteners"
  python setup.py install --root $pkgdir
}
