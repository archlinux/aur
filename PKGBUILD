# Maintainer: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>

pkgname=sclient
pkgver=0.7.2
pkgrel=5
pkgdesc="A small GTK-based MUD client for X"
arch=('i686' 'x86_64')
url="http://home.swipnet.se/heathen/linux/sclient.htm"
license=('GPL')
depends=('gtk')
makedepends=('patch')
source=(http://home.swipnet.se/heathen/linux/$pkgname-$pkgver.tar.gz
        gcc34.patch.bz2)
md5sums=('e399bad04fb5837c5be1d9874fbfac32'
         'b50782f37002b6e310f173b8c617c3f6')

prepare() {
  cd "${srcdir}"/$pkgname-$pkgver

  patch -Np1 -i "${srcdir}"/gcc34.patch
}

build() {
  cd "${srcdir}"/$pkgname-$pkgver

  ./configure --prefix=/usr
  make
}

package() {
  cd "${srcdir}"/$pkgname-$pkgver

  make prefix="${pkgdir}"/usr install
}
