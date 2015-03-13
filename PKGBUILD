# Maintainer: Ian D, Scott <ian@perebruin.com>
pkgname=wikicurses
pkgver=1.2
pkgrel=1
pkgdesc="A simple curses interface for accessing Wikipedia."
arch=('any')
url="https://github.com/ids1024/wikicurses"
license=('MIT')
makedepends=('python-setuptools')
depends=('python' 'python-urwid' 'python-beautifulsoup4' 'python-lxml')
backup=('etc/wikicurses.conf')
source=("https://github.com/ids1024/wikicurses/archive/v${pkgver}.tar.gz")
md5sums=('b9fde4ab2dc518eae0c373c35352b7bf')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py install --root="$pkgdir"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/wikicurses-git/LICENSE"
}
