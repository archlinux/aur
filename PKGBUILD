# Maintainer: Aren <rn+aur@peacevolution.org>
# Contributor: dni <office@dnilabs.com>
# Contributor: Fronkles McFranko <mrelfranko@disroot.org>

pkgname=lisgd
pkgver=0.3.4
pkgrel=1
pkgdesc="Bind gestures on touchscreens, and unsupported gesture devices via libinput touch events"
url="https://git.sr.ht/~mil/lisgd"
arch=('x86_64' 'i686' 'armv7h' 'aarch64')
license=('MIT')
depends=('libinput' 'libx11' 'wayland')
source=("$pkgname-$pkgver.tar.gz::https://git.sr.ht/~mil/lisgd/archive/$pkgver.tar.gz")
sha512sums=('53378491c0ba9f124ca0772c81099f4639387666b94bf16305dc560fc22d83e7155e9dde3817978616d2e241f4831eae3dab7d4fd5ef3020d9c5ecf4520b9ecd')

build() {
  cd "$pkgname-$pkgver"
  make
}

package() {
  cd "$pkgname-$pkgver"
  make PREFIX="/usr" DESTDIR="$pkgdir" install
}
