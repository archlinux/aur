# Maintainer: Ash <xash at riseup d0t net>
# Contributor: Aren <rn+aur@peacevolution.org>

pkgname=wvkbd
pkgver=0.21
pkgrel=1
pkgdesc='On-screen keyboard for wlroots'
url='https://git.sr.ht/~proycon/wvkbd'
arch=('x86_64' 'i686' 'armv7h' 'aarch64')
license=('GPL3')
depends=('wayland' 'pango' 'cairo' 'glibc')
makedepends=('fontconfig' 'libxkbcommon' 'scdoc')
source=("$pkgname-$pkgver.tar.gz::https://git.sr.ht/~proycon/wvkbd/archive/v$pkgver.tar.gz")
sha512sums=('891eeb14ba7c93a08e6dac8d534656d0ca67f150b3d9bd51da51186f8a4637c68d412a1091aba0449bac7da43afabcef00355dba0d6ddaaacc241b604be14bb1')

build() {
  make -C "$pkgname-v$pkgver"
}

package() {
  make -C "$pkgname-v$pkgver" PREFIX=/usr DESTDIR="$pkgdir" install
}
