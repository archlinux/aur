# Maintainer: Ash <xash at riseup d0t net>
# Contributor: Aren <rn+aur@peacevolution.org>

pkgname=wvkbd
pkgver=0.19.4
pkgrel=1
pkgdesc='On-screen keyboard for wlroots'
url='https://git.sr.ht/~proycon/wvkbd'
arch=('x86_64' 'i686' 'armv7h' 'aarch64')
license=('GPL3')
depends=('wayland' 'pango' 'cairo' 'glibc')
makedepends=('fontconfig' 'libxkbcommon' 'scdoc')
source=("$pkgname-$pkgver.tar.gz::https://git.sr.ht/~proycon/wvkbd/archive/v$pkgver.tar.gz")
sha512sums=('e9a877eac4913375a3ea160966d0822ed15be540234148ba2638e5b7c19cfa885b962eba260a0f782a762324732454cf48668d85307a748decb198abeb009784')

build() {
  make -C "$pkgname-v$pkgver"
}

package() {
  make -C "$pkgname-v$pkgver" PREFIX=/usr DESTDIR="$pkgdir" install
}
