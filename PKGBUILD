# Maintainer: Aren <rn+aur@peacevolution.org>
# Contributor: dni <office@dnilabs.com>
# Contributor: Fronkles McFranko <mrelfranko@disroot.org>

pkgname=lisgd
pkgver=0.3.5
pkgrel=1
pkgdesc="Bind gestures on touchscreens, and unsupported gesture devices via libinput touch events"
url="https://git.sr.ht/~mil/lisgd"
arch=('x86_64' 'i686' 'armv7h' 'aarch64')
license=('MIT')
depends=('libinput' 'libx11' 'wayland')
source=("$pkgname-$pkgver.tar.gz::https://git.sr.ht/~mil/lisgd/archive/$pkgver.tar.gz")
sha512sums=('4ee89d754e42523f5682efb59eda905d951a6b4dda086f24e58f93acd702dc3f7ffbbc7535c04af16c74dea024b5ab93f98cb5978c2c764bcc405e8fe32e27cc')

build() {
  cd "$pkgname-$pkgver"
  make
}

package() {
  cd "$pkgname-$pkgver"
  make PREFIX="/usr" DESTDIR="$pkgdir" install
}
