# Maintainer: Martin Müllenhaupt <mm+aur.archlinux.org@netlair.de>
pkgname=faf-ice-adapter
pkgver=2.2.2
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
sha256sums=('35e641312b4b371a041de1a15bf29a0c38d470d7e0f6fb7bc4bec2796fc6a81b')
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
