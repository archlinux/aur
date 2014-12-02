# Maintainer: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>

pkgname=sntop
pkgver=1.4.3
pkgrel=1
pkgdesc="Curses-based top-esque console utility for monitoring the connectivity of network hosts"
arch=('i686' 'x86_64')
url="http://sntop.sourceforge.net/"
license=('GPL')
depends=('ncurses' 'fping')
install=$pkgname.install
source=(http://downloads.sourceforge.net/project/$pkgname/$pkgname/$pkgver/$pkgname-$pkgver.tar.gz)
sha256sums=('943a5af1905c3ae7ead064e531cde6e9b3dc82598bbda26ed4a43788d81d6d89')

build() {
  cd $pkgname-$pkgver

  ./configure --prefix=/usr
  make
}

package() {
  cd $pkgname-$pkgver

  install -Dm755 $pkgname "${pkgdir}"/usr/bin/$pkgname
  install -Dm644 sntoprc.EXAMPLE "${pkgdir}"/usr/share/sntop/sntoprc.EXAMPLE
  install -Dm644 $pkgname.1 "${pkgdir}"/usr/share/man/man1/$pkgname.1
}
