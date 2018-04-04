# Maintainer: Martin Müllenhaupt <mm+aur.archlinux.org@netlair.de>
pkgname=faf-ice-adapter-bin
pkgver=6.2.2
pkgrel=1
epoch=0
pkgdesc="A P2P connection proxy for Supreme Commander: Forged Alliance using ICE"
url="http://www.faforever.com/"
arch=('x86_64')
license=('GPL3')
groups=()
checkdepends=()
optdepends=()
makedepends=('jq')
provides=('faf-ice-adapter=$pkgver')
conflicts=(faf-ice-adapter)
replaces=()
backup=()
options=()
install=
changelog=
source=("https://github.com/FAForever/ice-adapter/releases/download/v$pkgver/faf-ice-adapter")
md5sums=('6a49c180bd60045b44322cc5cea813ed')
noextract=()
validpgpkeys=()

pkgver() {
  curl -s https://api.github.com/repos/FAForever/ice-adapter/releases/latest | jq -r .tag_name | cut -d v -f 2
}

package() {
  install -D ./faf-ice-adapter "$pkgdir/usr/bin/faf-ice-adapter"
}
