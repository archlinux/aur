# Maintainer: Aren <rn+aur@peacevolution.org>
# Contributor: dni <office@dnilabs.com>
# Contributor: Fronkles McFranko <mrelfranko@disroot.org>

pkgname=lisgd
pkgver=0.4.0
pkgrel=1
pkgdesc="Bind gestures on touchscreens, and unsupported gesture devices via libinput touch events"
url="https://git.sr.ht/~mil/lisgd"
arch=('x86_64' 'i686' 'armv7h' 'aarch64')
license=('MIT')
depends=('libinput' 'libx11' 'wayland')
source=("$pkgname-$pkgver.tar.gz::https://git.sr.ht/~mil/lisgd/archive/$pkgver.tar.gz")
sha512sums=('315b4a423aef35b341160f92777bc867475e8be54f8de3f376677f6e1f2dc243cf8559044df0cde3ca9ef1b3e157a6deedabf159949aa9c0adefc548c55fa854')

build() {
  cd "$pkgname-$pkgver"
  make
}

package() {
  cd "$pkgname-$pkgver"
  make PREFIX="/usr" DESTDIR="$pkgdir" install
}
