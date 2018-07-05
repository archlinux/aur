# Maintainer: Martin Müllenhaupt <mm+aur.archlinux.org@netlair.de>
pkgname=faf-ice-adapter-bin
pkgver=6.3.1
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
sha256sums=('07ffa3df532b2d359d68c2d14fef6be32bc3f144880716b014092230d928c44f')
noextract=()
validpgpkeys=()

pkgver() {
  curl -s https://api.github.com/repos/FAForever/ice-adapter/releases/latest | jq -r .tag_name | cut -d v -f 2
}

package() {
  install -D $srcdir/faf-ice-adapter "$pkgdir/usr/bin/faf-ice-adapter"
}
