# Maintainer: Ash <xash at riseup d0t net>
# Contributor: Aren <rn+aur@peacevolution.org>

pkgname=wvkbd
pkgver=0.20
pkgrel=1
pkgdesc='On-screen keyboard for wlroots'
url='https://git.sr.ht/~proycon/wvkbd'
arch=('x86_64' 'i686' 'armv7h' 'aarch64')
license=('GPL3')
depends=('wayland' 'pango' 'cairo' 'glibc')
makedepends=('fontconfig' 'libxkbcommon' 'scdoc')
source=("$pkgname-$pkgver.tar.gz::https://git.sr.ht/~proycon/wvkbd/archive/v$pkgver.tar.gz")
sha512sums=('1c5204dc00f7a3bdfd199dfa88b513c46249b7832ba546c0554940539fcc4e0d55303a9f6edd17dd82fd2893b602b86395202311b3ec851f5e8f41895f682371')

build() {
  make -C "$pkgname-v$pkgver"
}

package() {
  make -C "$pkgname-v$pkgver" PREFIX=/usr DESTDIR="$pkgdir" install
}
