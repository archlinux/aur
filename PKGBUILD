# Maintainer: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>

pkgname=digup
pkgver=0.6.40
pkgrel=1
pkgdesc="Console tool to update md5sum or shasum digest files"
arch=('i686' 'x86_64')
url="http://idlebox.net/2009/digup/"
license=('GPL')
source=(http://idlebox.net/2009/$pkgname/$pkgname-$pkgver.tar.bz2)
md5sums=('448ab2f490cda7694a86769be0217a4c')

build() {
  cd "${srcdir}"/$pkgname-$pkgver

  ./configure --prefix=/usr
  make
}

package() {
  cd "${srcdir}"/$pkgname-$pkgver

  make DESTDIR="${pkgdir}" install
}
