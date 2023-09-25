# Maintainer: dec05eba <dec05eba@protonmail.com>

pkgname=vr-video-player-git
pkgver=r104.90e22e4
pkgrel=1
pkgdesc='A virtual reality video player for Linux'
arch=('x86_64')
url="https://git.dec05eba.com/vr-video-player"
license=('BSD')
depends=('glm' 'glew' 'sdl2' 'openvr' 'libx11' 'libxcomposite' 'libxfixes' 'mpv')
provides=('vr-video-player')
conflicts=('vr-video-player')
source=("${pkgname}-${pkgver}.tar.gz::https://dec05eba.com/snapshot/vr-video-player.git.${pkgver}.tar.gz")
sha512sums=('c7230906f93912f71863ee0a4c0e2b0a82801924d58bec0f33ea95c6cb03219cbde750f82afb37d379fcfa8967b7443486a0148b551dc682f3a3c7e36c672f6f')

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
