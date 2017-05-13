# Maintainer: Maxs <max dot van dot den dot branden @t gmail dot com>
pkgname="solarus-quest-editor"
pkgver="1.5.3"
pkgrel="1"
epoch=
pkgdesc="A graphical user interface to create and modify quests for the Solarus engine."
arch=("i686" "x86_64")
url="http://www.solarus-games.org/"
license=("GPL" "custom")
groups=()
depends=("solarus" "qt5-base" "qt5-tools")
makedepends=("cmake" "zip")
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("https://github.com/solarus-games/$pkgname/archive/v$pkgver.tar.gz")
noextract=()
md5sums=("fc72b5945c0dec121e82defc94281aad")

build() {
  cd "$srcdir/$pkgname-$pkgver"

  cmake -D CMAKE_BUILD_TYPE=Release -D CMAKE_INSTALL_PREFIX="/usr" .
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  make DESTDIR="${pkgdir}/" install
  install -Dm644 "license.txt" "$pkgdir/usr/share/licences/$pkgname/license.txt"
  install -Dm644 "images/logo/sqe-logo.png" "$pkgdir/usr/share/pixmaps/sqe-logo.png"
  install -Dm644 "resources/$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
}

