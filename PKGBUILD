# Maintainer: Patrick Burroughs (Celti) <celti@celti.name>
# Contributor: speps <speps at aur dot archlinux dot org>
# Contributor: TDY <tdy@gmx.com>

pkgname=wdiff
pkgver=1.2.2
pkgrel=1
pkgdesc="A wordwise implementation of GNU diff"
arch=('i686' 'x86_64')
url="http://www.gnu.org/software/$pkgname/"
license=('GPL3')
depends=('ncurses')
install="$pkgname.install"
source=("http://ftp.gnu.org/gnu/$pkgname/$pkgname-$pkgver.tar.gz")
sha256sums=('34ff698c870c87e6e47a838eeaaae729fa73349139fc8db12211d2a22b78af6b')

build() {
  cd $pkgname-$pkgver
  ./configure --prefix=/usr
  make
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir" install
}
