# Maintainer: Andy Alt <arch_stanton5995 at proton.me>

pkgname=dealers-choice
pkgver=0.0.1
pkgrel=1
pkgdesc="Multiplayer Stud and Draw Poker"
arch=('x86_64' 'aarch64')
url="https://github.com/Dealer-s-Choice/dealers_choice"
license=('MIT')
depends=('glibc' 'sdl2' 'sdl2_ttf' 'sdl2_image' 'sdl2_net' 'protobuf-c')
makedepends=('meson' 'ninja')
optdepends=('canfigger')

source=("https://github.com/Dealer-s-Choice/dealers_choice/releases/download/v${pkgver}/${pkgname}-${pkgver}.tar.xz")
sha256sums=('b0b17bd5d05b7a8820b285774ad2adea1d6972bf078057fd1d1171cb280ad228')

build() {
  arch-meson $pkgname-$pkgver build -Db_sanitize=none
  meson compile -v -C build
}

package() {
  DESTDIR="$pkgdir" meson install -C build
}
