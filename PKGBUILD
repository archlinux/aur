# Maintainer: Alexander Rødseth <rodseth@gmail.com>
# Contributor: Timur Antipin < kosmocap (at) gmail.com >

pkgname=joy2key
pkgver=1.6.3
pkgrel=2
pkgdesc='Translate joystick movements into keystrokes'
arch=('x86_64' 'i686')
url='https://sourceforge.net/projects/joy2key/'
license=('GPL2')
depends=('libx11' 'xorg-xwininfo')
source=("http://sourceforge.net/projects/$pkgname/files/$pkgname/$pkgver/$pkgname-$pkgver.tar.bz2")
sha256sums=('cf6f452632bb661cf889d843e9ebb9f4fe6ddf4bfe14193ebf74c2d1e2b89f50')

build() {
  cd "$pkgname-$pkgver"
  
  ./configure --prefix=/usr -x-libraries=/usr/lib
  make
}

package() {
  make -C "$pkgname-$pkgver" DESTDIR="$pkgdir" install
}

# vim:set ts=2 sw=2 et:
