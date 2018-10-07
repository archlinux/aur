# Maintainer: zapp-brannigan (fuerst.reinje@web.de)

pkgname=vdo
pkgrel=1
pkgver=6.2.0.239
pkgdesc='Userspace tools for managing VDO volumes'
arch=('x86_64')
url="https://github.com/dm-vdo/vdo"
license=('GPL2')
depends=('kvdo-dkms' 'python-yaml' 'device-mapper')
source=("$pkgname-$pkgver.tar.gz::https://github.com/dm-vdo/vdo/archive/$pkgver.tar.gz")
sha256sums=('9d394c353fd4e6e9529966ab915b14d752a118e39d578900d4fb4b98e0d30e20')

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
