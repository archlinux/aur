# Maintainer: Basso Daniele <daniele05 dot bass at gmail dot com>
pkgname=xiasl
pkgver=1.1.65
pkgrel=2
pkgdesc="Cross-platform DSDT&SSDT IDE"
arch=(x86_64)
url="https://github.com/ic005k/$pkgname"
license=('')
depends=(qt5-base acpica python-qscintilla-qt5)
makedepends=(glew glfw libxcb)
provides=()
conflicts=()
source=("$url/archive/refs/tags/$pkgver.tar.gz" "$pkgname.desktop")
sha256sums=('b3dcce7f00927cd43764fef7f21091e1c2f431032475733c97a723dafa2730f6'
            'b22c9061b8e51333318374202eba41f0fe1d65267b6fa200c185d298b9e042cd')

build() {
  cd "$srcdir/Xiasl-$pkgver"
  qmake
  make
}

package() {
  cd "$srcdir/Xiasl-$pkgver"
  install -Dm644 "$srcdir/$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
  install -Dm644 "$srcdir/Xiasl-$pkgver/icon.png" "$pkgdir/usr/share/icons/hicolor/256x256/apps/$pkgname.png"
  install -Dm755 "$srcdir/Xiasl-$pkgver/bin/release/Xiasl" $pkgdir/usr/bin/$pkgname
}
