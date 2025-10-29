# Maintainer: Tobin <rn+aur@tlittle72.org>

pkgname=wvkbd-deskintl
pkgver=0.18
pkgrel=1
pkgdesc='On-screen keyboard for wlroots. Wvkbd requires desktop version to be configured at compile time, so this is to make that easier.'
url='https://git.sr.ht/~proycon/wvkbd'
arch=('x86_64' 'i686' 'armv7h' 'aarch64')
license=('GPL3')
depends=('wayland' 'pango' 'cairo' 'glibc')
makedepends=('fontconfig' 'libxkbcommon' 'scdoc')
source=("wvkbd-$pkgver.tar.gz::https://git.sr.ht/~proycon/wvkbd/archive/v$pkgver.tar.gz")
sha512sums=('SKIP')
conflicts=('wvkbd' 'wvkbd-git')

build() {
  make LAYOUT=deskintl -C "wvkbd-v$pkgver"
}

package() {
  make LAYOUT=deskintl -C "wvkbd-v$pkgver" PREFIX=/usr DESTDIR="$pkgdir" install
}
