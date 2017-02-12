# Maintainer: Martin Müllenhaupt <mm+aur.archlinux.org@netlair.de>
pkgname=faf-ice-adapter
pkgver=5.1.2
pkgrel=1
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
source=("https://github.com/FAForever/ice-adapter/releases/download/v$pkgver/faf-ice-adapter.js" "https://github.com/FAForever/ice-adapter/releases/download/v5.0.0/wrtc.node.linux64")
sha256sums=('cdbe09fc30135e795ce451ab1f851e6eeec3085934ae3385a49a7f78949188a4'
            '70d6778f9db7ee46e9a07d2e8d28ff5d4c3c3b2320f794c32b8fd64d3b46a211')
noextract=()
validpgpkeys=()

package() {
  install -D "$srcdir/faf-ice-adapter.js" "$pkgdir/usr/lib/faf-ice-adapter/faf-ice-adapter.js"
  install -D "$srcdir/wrtc.node.linux64" "$pkgdir/usr/lib/faf-ice-adapter/wrtc.node"
  mkdir -p "$pkgdir/usr/bin"
  cd "$pkgdir/usr/bin" && ln -s "../lib/faf-ice-adapter/faf-ice-adapter.js" "./faf-ice-adapter"
  chmod +x "./faf-ice-adapter"
}
