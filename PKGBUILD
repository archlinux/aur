# Maintainer: zapp-brannigan (fuerst.reinje@web.de)

pkgname=vdo
pkgrel=1
pkgver=6.2.0.197
pkgdesc='Userspace tools for managing VDO volumes'
arch=('x86_64')
url="https://github.com/dm-vdo/vdo"
license=('GPL2')
depends=('kvdo' 'python' 'device-mapper')
source=("$pkgname-$pkgver.tar.gz::https://github.com/dm-vdo/vdo/archive/$pkgver.tar.gz")
sha256sums=('2ca31bfbf5aa960395a9b5b2e56745e6387b4934adfb8d2f06a525564d835a70')

build() {
  cd "$pkgname-$pkgver"
  make
}

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir" \
       unitdir=/usr/lib/systemd/system \
       presetdir=/usr/lib/systemd/system-preset \
       mandir=/usr/share/man \
       install
}
