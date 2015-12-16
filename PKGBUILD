# Maintainer: Hugo Osvaldo Barrera <hugo@barrera.io>

pkgname=todoman
pkgver=1.5.1
pkgrel=1
pkgdesc="A simple CalDav-based todo manager."
arch=("any")
url="https://gitlab.com/hobarrera/todoman"
license=('MIT')
depends=(python-icalendar python-urwid python-xdg python-ansi
         python-parsedatetime python-atomicwrites python-click
         python-setuptools_scm)
optdepends=('python-click-repl-git: the repl command.')
source=("https://pypi.python.org/packages/source/t/$pkgname/$pkgname-$pkgver.tar.gz")
md5sums=('92010aef79d431cacebda3e653acabab')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  python setup.py build
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  python setup.py install --root="$pkgdir"
}
