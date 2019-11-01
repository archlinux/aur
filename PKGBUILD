# Maintainer: Evans Jahja <evansjahja13@gmail..com>
# Contributor: Alexander Rødseth <rodseth@gmail.com>
# Contributor: Timur Antipin < kosmocap (at) gmail.com >

pkgname=joy2key
pkgver=1.6.3
pkgrel=4
pkgdesc='Translate joystick movements into keystrokes'
arch=('x86_64' 'i686')
url='https://github.com/joolswills/joy2key'
license=('GPL2')
depends=('libx11' 'xorg-xwininfo')
source=("$pkgname-$pkgver::git+https://github.com/joolswills/joy2key.git")
sha256sums=('SKIP')

# prepare() {
#   patch -p0 -i button_list_segfault.patch
# }

build() {
  cd "$pkgname-$pkgver"

  autoreconf --install
  autoconf
  ./configure --prefix=/usr -x-libraries=/usr/lib
  make
}

package() {
  make -C "$pkgname-$pkgver" DESTDIR="$pkgdir" install
}

# vim:set ts=2 sw=2 et:
