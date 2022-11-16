# Maintainer: Aren <rn+aur@peacevolution.org>
# Contributor: dni <office@dnilabs.com>
# Contributor: Fronkles McFranko <mrelfranko@disroot.org>

pkgname=lisgd
pkgver=0.3.6
pkgrel=1
pkgdesc="Bind gestures on touchscreens, and unsupported gesture devices via libinput touch events"
url="https://git.sr.ht/~mil/lisgd"
arch=('x86_64' 'i686' 'armv7h' 'aarch64')
license=('MIT')
depends=('libinput' 'libx11' 'wayland')
source=("$pkgname-$pkgver.tar.gz::https://git.sr.ht/~mil/lisgd/archive/$pkgver.tar.gz")
sha512sums=('775e68eb0ede7b83478ceaa647467114d21964b67ac08cdd538a1621688f831cd0ea43cfa9e04decd0ca6c395c5cf3938b84933cb04fd7cdbb8b50a9ec74aabf')

build() {
  cd "$pkgname-$pkgver"
  make
}

package() {
  cd "$pkgname-$pkgver"
  make PREFIX="/usr" DESTDIR="$pkgdir" install
}
