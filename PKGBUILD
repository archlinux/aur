# Maintainer: dec05eba <dec05eba@protonmail.com>

pkgname=vr-video-player-git
pkgver=r64.c35eb0e
pkgrel=1
pkgdesc='A virtual reality video player for x11 on Linux'
arch=('x86_64')
url="https://git.dec05eba.com/vr-video-player"
license=('BSD')
makedepends=('sibs')
depends=('glm' 'glew' 'sdl2' 'openvr' 'libx11' 'libxcomposite' 'libxfixes')
provides=('vr-video-player')
conflicts=('vr-video-player')
source=("${pkgname}-${pkgver}.tar.gz::https://dec05eba.com/snapshot/vr-video-player.git.tar.gz")
sha512sums=('371ff4fd4f6de9d4f4b5d8da34625ce85209141be04625eb02b7114e11b4f18cf4573a0799abdc4ab1d247aa2d0d5d7dd4c0341fa3f9d473887254b393627b2f')

build() {
  cd "$srcdir"
  sibs build --release
}

package() {
  cd "$srcdir"
  install -Dm755 "sibs-build/$(sibs platform)/release/vr-video-player" "$pkgdir/usr/bin/vr-video-player"
  install -Dm644 config/hellovr_actions.json "$pkgdir/usr/share/vr-video-player/hellovr_actions.json"
  install -Dm644 config/hellovr_bindings_generic.json "$pkgdir/usr/share/vr-video-player/hellovr_bindings_generic.json"
  install -Dm644 config/hellovr_bindings_vive_controller.json "$pkgdir/usr/share/vr-video-player/hellovr_bindings_vive_controller.json"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/vr-video-player/LICENSE"
}
