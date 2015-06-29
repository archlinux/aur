# Maintainer: Hugo Osvaldo Barrera <hugo@barrera.io>

pkgname=todoman
pkgver=1.2.1
pkgrel=1
pkgdesc="A simple CalDav-based todo manager."
arch=("any")
url="https://git.barrera.io/hobarrera/todoman"
license=('MIT')
depends=(python-docopt python-icalendar python-urwid python-xdg
         python-atomicwrites)
source=("$pkgver.tar.gz::https://git.barrera.io/hobarrera/$pkgname/repository/archive.tar.gz?ref=v$pkgver")
md5sums=('63347d4d4dfce90d2eec546894caf66e')

build() {
  cd "$srcdir/$pkgname.git"

  python setup.py build
}

package() {
  cd "$srcdir/$pkgname.git"

  python setup.py install --root="$pkgdir"
}
