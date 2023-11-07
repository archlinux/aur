# Maintainer: Aren <rn+aur@peacevolution.org>

pkgname=wvkbd
pkgver=0.14.3
pkgrel=1
pkgdesc='On-screen keyboard for wlroots'
url='https://git.sr.ht/~proycon/wvkbd'
arch=('x86_64' 'i686' 'armv7h' 'aarch64')
license=('GPL3')
depends=('wayland' 'pango' 'cairo')
makedepends=('fontconfig' 'libxkbcommon')
source=("$pkgname-$pkgver.tar.gz::https://git.sr.ht/~proycon/wvkbd/archive/v$pkgver.tar.gz")
sha512sums=('0da5d032ad0f70e5a211b9d91127cbea80acaa38c02b51d95a3be586a058a3622f9afd9cda8f742b46e5c60b15d08622bf6a31a27ebc6b42811d016f7f379c6d')

build() {
  make -C "$pkgname-v$pkgver"
}

package() {
  make -C "$pkgname-v$pkgver" PREFIX=/usr DESTDIR="$pkgdir" install
}
