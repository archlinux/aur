# Maintainer: Hugo Osvaldo Barrera <hugo@barrera.io>

pkgname=todoman-git
_pkgname=todoman
pkgver=latest
pkgrel=3
pkgdesc="A simple CalDav-based todo manager."
arch=("any")
url="https://git.barrera.io/hobarrera/todoman"
license=('MIT')
depends=(python-docopt python-icalendar python-urwid python-xdg python-ansi
         python-parsedatetime)
optdepends=('python-click-repl-git: the repl command.')
conflicts=("todoman")
provides=("todoman")
source=(git+https://git.barrera.io/hobarrera/todoman.git)
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/$_pkgname"
  python setup.py build
}

package() {
  cd "$srcdir/$_pkgname"
  python setup.py install --root="$pkgdir"
}
