# Maintainer: Basso Daniele <daniele05 dot bass at gmail dot com>
pkgname=oc-auxiliary-tools
pkgver=20220213
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
sha256sums=('f2ac2d652b9843ca3870d4e747a604a3c4f40e1413658344f85f2a99e3a47c6c'
            'fbff8d4bddd4e410623eeecb5afdd8578cfe64d0e633373ab5d93170bf4d007a')

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
