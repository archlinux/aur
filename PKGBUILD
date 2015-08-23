# Maintainer: Hugo Osvaldo Barrera <hugo@barrera.io>

pkgname=todoman
pkgver=1.3
_pkghash=76f851dc91dfaa3c71341465d1b1cbab55b898a7
pkgrel=1
pkgdesc="A simple CalDav-based todo manager."
arch=("any")
url="https://gitlab.com/hobarrera/todoman"
license=('MIT')
depends=(python-icalendar python-urwid python-xdg python-ansi
         python-parsedatetime python-atomicwrites python-click)
optdepends=('python-click-repl-git: the repl command.')
source=("$pkgver.tar.gz::https://gitlab.com/hobarrera/$pkgname/repository/archive.tar.gz?ref=v$pkgver")
md5sums=('c770a1078552596390f852495684361c')

build() {
  cd "$srcdir/$pkgname-v$pkgver-$_pkghash"

  python setup.py build
}

package() {
  cd "$srcdir/$pkgname-v$pkgver-$_pkghash"

  python setup.py install --root="$pkgdir"
}
