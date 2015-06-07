# Maintainer: Ian D, Scott <ian@perebruin.com>
pkgname=wikicurses
pkgver=1.3
pkgrel=1
pkgdesc="A simple curses interface for accessing Wikipedia."
arch=('any')
url="https://github.com/ids1024/wikicurses"
license=('MIT')
makedepends=('python-setuptools')
depends=('python' 'python-urwid' 'python-beautifulsoup4' 'python-lxml')
backup=('etc/wikicurses.conf')
source=("https://github.com/ids1024/wikicurses/archive/v${pkgver}.tar.gz"
"https://github.com/ids1024/wikicurses/releases/download/v${pkgver}/v${pkgver}.tar.gz.asc")
md5sums=('3b22096c2ec9a4f94c609295323d4a70' 'SKIP')
validpgpkeys=('098BF569A360E234CE2B861A4924E10E199B5959')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py install --root="$pkgdir"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/wikicurses-git/LICENSE"
}
