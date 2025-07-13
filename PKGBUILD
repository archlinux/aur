# Maintainer: Andy Alt <arch_stanton5995 at proton.me>

pkgname=dealers-choice
pkgver=0.0.6
pkgrel=1
pkgdesc="Online Multiplayer Stud and Draw Poker"
arch=('x86_64' 'aarch64')
url="https://github.com/Dealer-s-Choice/dealers_choice"
license=('MIT')
depends=('glibc' 'sdl2' 'sdl2_ttf' 'sdl2_image' 'sdl2_net' 'protobuf-c')
makedepends=('cmake' 'meson' 'ninja')
optdepends=('canfigger')

source=("https://github.com/Dealer-s-Choice/dealers_choice/releases/download/v${pkgver}/${pkgname}-${pkgver}.tar.xz")
sha256sums=('2d6e1cb88d3f26376aefe734ba36cb96c75b5468b3365a769af0c140a3dc3a06')

build() {
  arch-meson $pkgname-$pkgver build -Db_sanitize=none
  meson compile -v -C build
}

package() {
  DESTDIR="$pkgdir" meson install -C build
}
