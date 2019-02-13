# Contributor: Clayton Craft <clayton@craftyguy.net>

pkgname=python-pudb-git
_pkgname=pudb
pkgver=v2018.1.r48.g7a5fdf9
pkgrel=1
pkgdesc="A full-screen, console-based Python debugger"
url="http://pypi.python.org/pypi/pudb"
arch=('any')
license=('MIT')
makedepends=('python-urwid' 'python-pygments')
depends=('python-urwid' 'python-pygments')
provides=('python-pudb')
conflicts=('python-pudb')

source=("git+https://github.com/inducer/pudb.git")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir"/"$_pkgname"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir"/"$_pkgname"
  python setup.py build

}

package() {
  cd "$srcdir"/"$_pkgname"
  python setup.py install --root="$pkgdir" --optimize=1
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

# vim: set ft=sh ts=2 sw=2 et:
