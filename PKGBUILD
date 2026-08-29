# Maintainer: Forest Ames <fox dot ames at smallfox dot io>
pkgname=multiworld-gg-bin
pkgver=0.7.268
pkgrel=1
pkgdesc="MultiworldGG Multi-Game Randomizer and Server - Fork of Archipelago"
arch=('x86_64')
url="https://github.com/MultiworldGG/MultiworldGG"
license=('GPL-3.0')
provides=('multiworld-gg')
conflicts=('multiworld-gg')
depends=('python')
optdepends=('xdg-terminal-exec: Better terminal support')
makedepends=()
checkdepends=()
source=("https://github.com/MultiworldGG/MultiworldGG/releases/download/${pkgver}/MultiworldGG_${pkgver}_linux-x86_64.tar.gz")
sha256sums=('304b77270eefb8219515f2cbf64a740b133865be9770470fbe393480d2cf33bb')

package() {
  install -d "$pkgdir/opt"
  cp -r "$srcdir/MultiworldGG" "$pkgdir/opt/"
  chown -R :games "$pkgdir/opt/MultiworldGG"
  chmod -R g+w "$pkgdir/opt/MultiworldGG"
  mkdir -p "$pkgdir/usr/share/applications"
  cat <<EOF >"$pkgdir/usr/share/applications/MultiworldGG.desktop"
[Desktop Entry]
Version=1.0
Exec=/opt/MultiworldGG/MultiworldGGLauncher
Path=/opt/MultiworldGG/
Name=MultiworldGG
Type=Application
Icon=/opt/MultiworldGG/icon.png
Categories=Game;
Keywords=multi-game;randomizer;
EOF
}
