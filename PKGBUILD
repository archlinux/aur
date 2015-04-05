# Maintainer: Ian D. Scott <ian@perebruin.com>
pkgname=wikicurses-git
pkgver=v1.2.r1.gbee3398
pkgrel=1
pkgdesc="A simple curses interface for accessing Wikipedia."
arch=('any')
url="https://github.com/ids1024/wikicurses"
license=('MIT')
makedepends=('git' 'python-setuptools')
depends=('python' 'python-urwid' 'python-beautifulsoup4' 'python-lxml')
backup=('etc/wikicurses.conf')
source=('git://github.com/ids1024/wikicurses.git')
md5sums=('SKIP')
_gitname="wikicurses"

pkgver () {
  cd $srcdir/$_gitname
  git describe --long | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
}

package() {
  cd "$srcdir/$_gitname"
  python setup.py install --root="$pkgdir"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/wikicurses-git/LICENSE"
}
