# Maintainer: Rudy Matela <rudy@matela.com.br>
# Contributor: Rudy Matela <rudy@matela.com.br>
# Contributor: Max R. P. Grossmann <m@max.pm>
# Contributor: Thorsten Töpper <atsutane-tu@freethoughts.de>
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: Giovanni Scafora <giovanni@archlinux.org>
# Contributor: Daniel J Griffiths <ghost1227@archlinux.us>

pkgname=ccrypt
pkgver=1.11
pkgrel=1
pkgdesc='A command-line utility for encrypting and decrypting files and streams'
arch=('x86_64')
url="http://ccrypt.sourceforge.net"
license=('GPL2')
depends=('glibc')
source=("http://downloads.sourceforge.net/$pkgname/$pkgname-$pkgver.tar.gz")
sha1sums=('6d20a4db9ef7caeea6ce432f3cffadf10172e420')

build() {
  cd $pkgname-$pkgver
  ./configure --prefix=/usr --mandir=/usr/share/man
  make
}

package() {
  cd $pkgname-$pkgver

  make DESTDIR="$pkgdir" install
}
