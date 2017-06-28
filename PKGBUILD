# Maintainer: Lex Black <autumn-wind at web dot de>

pkgname=canto-curses
pkgver=0.9.9
pkgrel=1
pkgdesc="ncurses user interface for canto-daemon"
url="https://codezen.org/canto-ng/"
license=("GPL")
arch=('i686' 'x86_64')
depends=('ncurses' 'readline' 'canto-daemon>=0.9.2')
optdepends=('xdg-utils: xdg-open is used as default browser')
source=(${pkgname}-${pkgver}.tar.gz::https://github.com/themoken/$pkgname/archive/v$pkgver.tar.gz)
md5sums=('3f3e13e0ee60e264102b850ebc179c77')


build() {
  cd ${pkgname}-${pkgver}
  python setup.py build
}

package() {
  cd ${pkgname}-${pkgver}
  python setup.py install --prefix=/usr --root=${pkgdir}  --optimize=1 --skip-build
}
