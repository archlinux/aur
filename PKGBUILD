# Maintainer: Martin Müllenhaupt <mm+aur.archlinux.org@netlair.de>
pkgname=faf-ice-adapter
pkgver=5.1.4
pkgrel=2
epoch=0
pkgdesc="A P2P connection proxy for Supreme Commander: Forged Alliance using ICE"
url="http://www.faforever.com/"
arch=('x86_64')
license=('GPL3')
groups=()
depends=('nodejs')
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("https://github.com/FAForever/ice-adapter/releases/download/v$pkgver/faf-ice-adapter.js" "https://github.com/FAForever/node-webrtc/releases/download/v0.0.61-faf3/wrtc-linux64.node")
sha256sums=('0333092173cb210c0f68752d49d5b4c1b97c00ec4bc0f4c30e96fedf3d7e599f'
            'dd4572d6c089252d77d7f1c73607e05deafd32d40c00621034476046b04269ba')
noextract=()
validpgpkeys=()

package() {
  install -D "$srcdir/faf-ice-adapter.js" "$pkgdir/usr/lib/faf-ice-adapter/faf-ice-adapter.js"
  install -D "$srcdir/wrtc-linux64.node" "$pkgdir/usr/lib/faf-ice-adapter/wrtc.node"
  mkdir -p "$pkgdir/usr/bin"
  cd "$pkgdir/usr/bin" && ln -s "../lib/faf-ice-adapter/faf-ice-adapter.js" "./faf-ice-adapter"
  chmod +x "./faf-ice-adapter"
}
