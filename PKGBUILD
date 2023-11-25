# Maintainer: dec05eba <dec05eba@protonmail.com>

pkgname=vr-video-player-git
pkgver=r105.d44c260
pkgrel=1
pkgdesc='A virtual reality video player for Linux'
arch=('x86_64')
url="https://git.dec05eba.com/vr-video-player"
license=('BSD')
depends=('glm' 'glew' 'sdl2' 'openvr' 'libx11' 'libxcomposite' 'libxfixes' 'mpv')
provides=('vr-video-player')
conflicts=('vr-video-player')
source=("${pkgname}-${pkgver}.tar.gz::https://dec05eba.com/snapshot/vr-video-player.git.${pkgver}.tar.gz")
sha512sums=('0d8971b9f20ca47ee2d01d65dba9814c78f4f997e71414a7d8f55dcac1c167a06b5b3c2823eccd18f9b44feeee394602ed5dd74fedc96baba94f82de49bade34')

build() {
  cd "$srcdir"
  ./build.sh
}

package() {
  cd "$srcdir"
  install -Dm755 "vr-video-player" "$pkgdir/usr/bin/vr-video-player"
  install -Dm644 config/hellovr_actions.json "$pkgdir/usr/share/vr-video-player/hellovr_actions.json"
  install -Dm644 config/hellovr_bindings_generic.json "$pkgdir/usr/share/vr-video-player/hellovr_bindings_generic.json"
  install -Dm644 config/hellovr_bindings_vive_controller.json "$pkgdir/usr/share/vr-video-player/hellovr_bindings_vive_controller.json"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/vr-video-player/LICENSE"
}
