# Maintainer: Maxs <max dot van dot den dot branden @t gmail dot com>
pkgname=solarus-quest-editor
pkgver=1.4.2
pkgrel=1
epoch=
pkgdesc="A graphical user interface to create and modify quests for the Solarus engine."
arch=(i686 x86_64)
url=http://www.solarus-games.org/
license=(GPL custom)
groups=()
depends=(solarus qt5-base qt5-tools)
makedepends=(cmake zip)
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=(https://github.com/christopho/$pkgname/archive/v$pkgver.tar.gz $pkgname.desktop)
noextract=()
md5sums=(e8cad3ca7cbe741c4270e57317887933 38afc75a98448ddc6470f1efa41d7904)

build() {
  cd "$srcdir/$pkgname-$pkgver"

  cmake -D CMAKE_BUILD_TYPE=Release .
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 "images/logo/sqe-logo.png" "$pkgdir/usr/share/pixmaps/sqe-logo.png"
  install -Dm644 "license.txt" "$pkgdir/usr/share/licences/$pkgname/license.txt"

  cd "$startdir"

  install -Dm644 "$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
}

