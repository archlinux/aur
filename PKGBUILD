# Maintainer: Martin Müllenhaupt <mm+aur.archlinux.org@netlair.de>
pkgname=faf-ice-adapter
pkgver=3.0.2
pkgrel=1
epoch=0
pkgdesc="Forged Alliance Forever - ICE connectivity helper for the lobby client."
url="http://www.faforever.com/"
arch=('i686' 'x86_64')
license=('GPL3')
groups=()
depends=('boost' 'glibmm' 'jsoncpp' 'libnice-git')
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
sha256sums=('6e7f49ff4ea03d2c6fad32c62a971a94301f21471b29706d452e4a8813acc110')
noextract=()
validpgpkeys=()

build() {
  mkdir -p "$srcdir/build"
    cd "$srcdir/build"

    cmake "$srcdir/ice-adapter-$pkgver" \
        -DCMAKE_BUILD_TYPE=Release \
        -DFAF_VERSION_STRING=$pkgver
    make
}

package() {
  install -D "$srcdir/build/faf-ice-adapter" "$pkgdir/usr/bin/faf-ice-adapter"
}
