# Maintainer: Aren <rn+aur@peacevolution.org>

pkgname=wvkbd
pkgver=0.14
pkgrel=1
pkgdesc='On-screen keyboard for wlroots'
url='https://git.sr.ht/~proycon/wvkbd'
arch=('x86_64' 'i686' 'armv7h' 'aarch64')
license=('GPL3')
depends=('wayland' 'pango' 'cairo')
makedepends=('fontconfig' 'libxkbcommon')
source=("$pkgname-$pkgver.tar.gz::https://git.sr.ht/~proycon/wvkbd/archive/v$pkgver.tar.gz")
sha512sums=('a31863823b22fc472c9596daea0db0d4531b10aca580eadcc37ac9b1502335179083f84bcbca319896a2ccec35baca1ab345a1ea12fbd8d74bcdb8821a807320')

build() {
  make -C "$pkgname-v$pkgver"
}

package() {
  make -C "$pkgname-v$pkgver" PREFIX=/usr DESTDIR="$pkgdir" install
}
