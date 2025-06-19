# Maintainer: Andy Alt <arch_stanton5995 at proton.me>

pkgname=dealers-choice
pkgver=0.0.2
pkgrel=1
pkgdesc="Online Multiplayer Stud and Draw Poker"
arch=('x86_64' 'aarch64')
url="https://github.com/Dealer-s-Choice/dealers_choice"
license=('MIT')
depends=('glibc' 'sdl2' 'sdl2_ttf' 'sdl2_image' 'sdl2_net' 'protobuf-c')
makedepends=('meson' 'ninja')
optdepends=('canfigger')

source=("https://github.com/Dealer-s-Choice/dealers_choice/releases/download/v${pkgver}/${pkgname}-${pkgver}.tar.xz")
sha256sums=('947f40b483112cd92dd68e4e1b134ba550736f5cb5ce290b9df4b71c77d3aca2')

build() {
  arch-meson $pkgname-$pkgver build -Db_sanitize=none
  meson compile -v -C build
}

package() {
  DESTDIR="$pkgdir" meson install -C build
}
