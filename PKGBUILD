# Maintainer: Hugo Osvaldo Barrera <hugo@barrera.io>

pkgname=todoman
pkgver=1.3.3
pkgrel=1
pkgdesc="A simple CalDav-based todo manager."
arch=("any")
url="https://gitlab.com/hobarrera/todoman"
license=('MIT')
depends=(python-icalendar python-urwid python-xdg python-ansi
         python-parsedatetime python-atomicwrites python-click)
optdepends=('python-click-repl-git: the repl command.')
source=("https://pypi.python.org/packages/source/t/$pkgname/$pkgname-$pkgver.tar.gz")
md5sums=('0d4dae4f5215f2fe7dbfd3088775dae1')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  python setup.py build
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  python setup.py install --root="$pkgdir"
}
