# Maintainer: Daniel E. Shub <daniel.e.shub@gmail.com>

pkgname=python-macropy
pkgver=1.1.0b2
pkgrel=1
pkgdesc="An implementation of Syntactic Macros in the Python Programming Language"
arch=('any')
url="https://pypi.org/project/macropy3/"
license=('MIT')
makedepends=('python-setuptools')
depends=('python')
source=("https://github.com/lihaoyi/macropy/archive/v$pkgver.zip")
sha512sums=('738de4ebb03c5cf44e9c31deb6d7854d74e1f2a84e5d10dcda91e49457bdfff4df7d5a0110de1d8892079b8add7ee678359298959d5bd7e7d83886fa5d62b993')

build() {
  cd $srcdir/macropy-$pkgver
  python setup.py build
}

package() {
  cd $srcdir/macropy-$pkgver
  python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
