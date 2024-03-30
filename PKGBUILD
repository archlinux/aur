# Maintainer: dec05eba <dec05eba@protonmail.com>

pkgname=vr-video-player-git
pkgver=r135.42ef50f
pkgrel=1
pkgdesc='A virtual reality video player for Linux'
arch=('x86_64')
url="https://git.dec05eba.com/vr-video-player"
license=('BSD')
depends=('glm' 'glew' 'sdl2' 'openvr' 'libx11' 'libxcomposite' 'libxfixes' 'mpv' 'xdotool')
provides=('vr-video-player')
conflicts=('vr-video-player')
source=("${pkgname}-${pkgver}.tar.gz::https://dec05eba.com/snapshot/vr-video-player.git.${pkgver}.tar.gz")
sha512sums=('6bc965a671d1efd773c7dde719e34ece75f5ade6c6a93742f69ec7889f6c14a1fe7ae4b01c2119dafc411b8550ceb712796467ea5d309ef3c6567d91e3a671db')

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
