# Maintainer: Hugo Osvaldo Barrera <hugo@barrera.io>

pkgname=todoman
pkgver=1.3
pkgrel=1
pkgdesc="A simple CalDav-based todo manager."
arch=("any")
url="https://gitlab.com/hobarrera/todoman"
license=('MIT')
depends=(python-icalendar python-urwid python-xdg python-ansi
         python-parsedatetime python-atomicwrites python-click)
optdepends=('python-click-repl-git: the repl command.')
source=("$pkgver.tar.gz::https://gitlab.com/hobarrera/$pkgname/repository/archive.tar.gz?ref=v$pkgver")
md5sums=('014cf154b0253ded3bb4a39f6dd1f4f9')

build() {
  cd "$srcdir/$pkgname.git"

  python setup.py build
}

package() {
  cd "$srcdir/$pkgname.git"

  python setup.py install --root="$pkgdir"
}
