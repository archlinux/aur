# Maintainer: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>

pkgname=kudus
pkgver=0.3.0
pkgrel=2
pkgdesc="Sudoku puzzle generator and solver for KDE"
arch=('i686' 'x86_64')
url="http://www.leonscape.co.uk/linux/kudus"
license=('GPL')
depends=('kdelibs3' 'qt3')
source=(http://www.leonscape.co.uk/linux/$pkgname/$pkgname-$pkgver.tar.bz2)
md5sums=('0244e9d4b282d193cffb86bbfe8fa10b')

build() {
  cd "${srcdir}"/$pkgname-0.3

  ./configure --prefix=/opt/kde
  make
}

package() {
  cd "${srcdir}"/$pkgname-0.3

  make DESTDIR="${pkgdir}" install
}