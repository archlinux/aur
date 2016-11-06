# Maintainer: Martin Müllenhaupt <mm+aur.archlinux.org@netlair.de>
pkgname=faf-ice-adapter
pkgver=1.0.0
pkgrel=1
epoch=0
pkgdesc="Forged Alliance Forever - ICE connectivity helper for the lobby client."
url="http://www.faforever.com/"
arch=('i686' 'x86_64')
license=('GPL3')
groups=()
depends=('boost' 'glibmm' 'jsoncpp')
makedepends=('cmake')
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("https://github.com/FAForever/ice-adapter/archive/v$pkgver.tar.gz")
sha256sums=('55784e39043fe7e315aa7dbe73325c506415337d520ec76894330b033152118c')
noextract=()
validpgpkeys=()

build() {
  mkdir -p "$srcdir/build"
    cd "$srcdir/build"

    cmake "$srcdir/ice-adapter-$pkgver" \
        -DCMAKE_BUILD_TYPE=Release
    make
}

package() {
  install -D "$srcdir/build/faf-ice-adapter" "$pkgdir/usr/bin/faf-ice-adapter"
}
