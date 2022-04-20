# Maintainer: Basso Daniele <daniele05 dot bass at gmail dot com>
pkgname=oc-auxiliary-tools
pkgver=20220206
pkgrel=1
pkgdesc="Cross-platform GUI management tools for OpenCore"
arch=(x86_64)
url="https://github.com/ic005k/OCAuxiliaryTools"
license=('MIT')
depends=(qt5-base)
makedepends=(glew glfw libxcb)
provides=()
conflicts=()
source=("$url/archive/refs/tags/$pkgver.tar.gz" "$pkgname.desktop")
md5sums=('6e2c553a2fc1a5deb445443805e4447a' '62b8bb061f709d193a2d7b7355b4cfbb')

build() {
  cd "$srcdir/OCAuxiliaryTools-$pkgver"
  qmake
  make
}

package() {
  install -Dm644 "$srcdir/$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
  install -Dm644 "$srcdir/OCAuxiliaryTools-$pkgver/icon.png" "$pkgdir/usr/share/icons/hicolor/256x256/apps/$pkgname.png"
  install -Dm755 "$srcdir/OCAuxiliaryTools-$pkgver/bin/release/OCAuxiliaryTools" $pkgdir/usr/bin/$pkgname
}
