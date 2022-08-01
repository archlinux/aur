# Maintainer: Aren <rn+aur@peacevolution.org>

pkgname=wvkbd
pkgver=0.9
pkgrel=1
pkgdesc='On-screen keyboard for wlroots'
url='https://git.sr.ht/~proycon/wvkbd'
arch=('x86_64' 'i686' 'armv7h' 'aarch64')
license=('GPL3')
depends=('wayland' 'pango')
makedepends=('fontconfig' 'libxkbcommon')
source=("$pkgname-$pkgver.tar.gz::https://git.sr.ht/~proycon/wvkbd/archive/v$pkgver.tar.gz")
sha512sums=('11214e5386ab1b2601efc0ed0442d1be5e39901c658cd3e68c829dffc1939078e9af5c58df8c131c37b544016db9aaf7e03150dc5b501b7279c5bb337792f169')

build() {
  make -C "$pkgname-v$pkgver"
}

package() {
  make -C "$pkgname-v$pkgver" PREFIX=/usr DESTDIR="$pkgdir" install
}
