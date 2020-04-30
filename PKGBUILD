# Python package author: Charles Leifer <UNKNOWN>
# Maintainer: Uko Koknevics <perkontevs@gmail.com>
# Maintainer: Nathan Owens <ndowens @ artixlinux.org>

pkgname=python-unqlite
pkgver=0.8.1
pkgrel=1
pkgdesc="Fast Python bindings for the UnQLite embedded NoSQL database."
arch=('x86_64' 'i686')
url="https://github.com/coleifer/unqlite-python"
license=(MIT)
makedepends=('python-pip' 'git' 'cython')
depends=('python')
source=("git+https://github.com/coleifer/unqlite-python.git#tag=${pkgver}")
md5sums=('SKIP')

build() {
  cd "$srcdir/unqlite-python"
  python setup.py build
}

package() {
  cd "$srcdir/unqlite-python"
  python setup.py install --root="$pkgdir" --optimize=1

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
