# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: lh <jason52lh@gmail.com>

pkgname=fcitx-rime
pkgver=0.3.1
pkgrel=3
pkgdesc='Fcitx Wrapper for librime'
arch=('i686' 'x86_64')
url="http://code.google.com/p/fcitx"
license=('GPL')
depends=('fcitx' "librime" "brise")
makedepends=('cmake')
source=("https://download.fcitx-im.org/$pkgname/$pkgname-$pkgver.tar.xz") #  {,.sig})
sha512sums=('5d3c8fc119e1a104987a7876f3b1c54da074e34ce9feb9c02efa7c9cfd788c3735680a03cdb50d69a5512a9f075c7326bdc267cf076daa916238898da81d2388')
# validpgpkeys=('2CC8A0609AD2A479C65B6D5C8E8B898CBF2412F9')  # Weng Xuetian

build() {
  cd $pkgname-$pkgver

  cmake -DCMAKE_INSTALL_PREFIX=/usr .
  make
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir" install
}
