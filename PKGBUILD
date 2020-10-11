# Maintainer: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>

pkgname=digup
pkgver=0.6.57
pkgrel=1
pkgdesc="Console tool to update md5sum or shasum digest files"
arch=('i686' 'x86_64')
url="http://idlebox.net/2009/digup/"
license=('GPL')
source=(http://idlebox.net/2009/$pkgname/$pkgname-$pkgver.tar.gz)
sha256sums=('ef132e277277fc28091e714980db55021272fa5c3a9134968cdeeef28305186e')

build() {
  cd "${srcdir}"/$pkgname-$pkgver

  ./configure --prefix=/usr
  make
}

package() {
  cd "${srcdir}"/$pkgname-$pkgver

  make DESTDIR="${pkgdir}" install
}
