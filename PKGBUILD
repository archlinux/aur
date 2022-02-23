# Maintainer: Basso Daniele <daniele05 dot bass at gmail dot com>
pkgname=oc-auxiliary-tools
pkgver=20220193
pkgrel=1
pkgdesc="Cross-platform GUI management tools for OpenCore"
arch=(x86_64)
url="https://github.com/ic005k/OCAuxiliaryTools"
license=('')
depends=(qt5-base)
makedepends=(glew glfw libxcb)
provides=()
conflicts=()
source=("https://github.com/ic005k/OCAuxiliaryTools/archive/refs/tags/$pkgver.tar.gz" "oc-auxiliary-tools.desktop")
md5sums=('4d80127040b786db7bfd39736b5dd670' '609d3c45ab44be86dc3251346f2240d7') #autofill using updpkgsums

build() {
  cd "$srcdir/OCAuxiliaryTools-$pkgver"
  qmake
  make
}

package() {
  install -Dm644 "$srcdir/$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
  install -Dm644 "$srcdir/OCAuxiliaryTools-$pkgver/icon.png" "$pkgdir/usr/share/icons/hicolor/256x256/apps/$pkgname.png"
  install -Dm755 "$srcdir/OCAuxiliaryTools-$pkgver/bin/release/OCAuxiliaryTools" $pkgdir/usr/bin/oc-auxiliary-tools
}
