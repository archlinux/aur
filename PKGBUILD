# Maintainer: dec05eba <dec05eba@protonmail.com>

pkgname=vr-video-player-git
pkgver=r80.ac823a5
pkgrel=1
pkgdesc='A virtual reality video player for x11 on Linux'
arch=('x86_64')
url="https://git.dec05eba.com/vr-video-player"
license=('BSD')
depends=('glm' 'glew' 'sdl2' 'openvr' 'libx11' 'libxcomposite' 'libxfixes')
provides=('vr-video-player')
conflicts=('vr-video-player')
source=("${pkgname}-${pkgver}.tar.gz::https://dec05eba.com/snapshot/vr-video-player.git.r80.ac823a5.tar.gz")
sha512sums=('665eb625a4b5868878aaac7dabc04df6f56809fe8b3fd9991f4255511fd0951163ab5244228362d3441e58c34589993439c67bc35a6d38860be6288611384c1e')

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
