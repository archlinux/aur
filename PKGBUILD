# Maintainer: Rafael Fontenelle <rafaelff@gnome.org>
# Contributor:  <qqqqqqqqq9 AT web DOT de
# Contributor: Patrick Burroughs (Celti) <celti@celti.name>
# Contributor: speps <speps at aur dot archlinux dot org>
# Contributor: TDY <tdy@gmx.com>

pkgname=wdiff
pkgver=1.2.2
pkgrel=2
pkgdesc="A wordwise implementation of GNU diff"
arch=('x86_64')
url="https://www.gnu.org/software/$pkgname/"
license=('GPL3')
depends=('ncurses')
source=("https://ftp.gnu.org/gnu/$pkgname/$pkgname-$pkgver.tar.gz")
sha256sums=('34ff698c870c87e6e47a838eeaaae729fa73349139fc8db12211d2a22b78af6b')

build() {
  cd $pkgname-$pkgver
  ./configure --prefix=/usr
  make
}

check() {
  cd $pkgname-$pkgver
  make -k check
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir" install
}
