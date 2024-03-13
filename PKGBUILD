# Maintainer: waschtl <tyrolyean@tyrolyean.net>

pkgname=icy_draw-bin
pkgver=0.2.1
pkgrel=1
provides=("icy_draw")
pkgdesc="IcyDraw is a full features ansi drawing tool doing things a bit different than other tools."
arch=('x86_64')
url="https://github.com/mkrueger/icy_draw"
license=('Apache-2.0')
makedepends=()
optdepends=()
source=("$url/releases/download/$pkgver/icy_draw_linux_$pkgver.zip")
sha256sums=('6a5a747583b5a6e9add1bde66db4f8e6fa2c3fc7a6a0a0762b7308db8e976a2a')
sha512sums=('4b526ae01109c8a13bb28c4aceae0279dc5dd9a21f857c3c4267fdb4c927c836efb4a401ccafa2cfaf4bb3a1951bf5fd263ac32a5f68b66e08d378507e9c8acd')

prepare() {
	cd "${srcdir}/"
	ar -x "icy_draw_${pkgver}_amd64.deb"
	bsdtar -xvf data.tar.xz
}

package() {
  cd "${srcdir}/"
  install -DTm0755 "$srcdir/usr/share/doc/icy-draw/copyright" "$pkgdir/usr/share/doc/icy-draw/copyright"
  install -DTm0755 "$srcdir/usr/share/applications/icy_draw.desktop" "$pkgdir/usr/share/applications/icy_draw.desktop"
  install -DTm0755 "$srcdir/usr/share/icons/hicolor/128x128/apps/icy_draw.png" "$pkgdir/usr/share/icons/hicolor/128x128/apps/icy_draw.png"
  install -DTm0755 "$srcdir/usr/share/icons/hicolor/256x256/apps/icy_draw.png" "$pkgdir/usr/share/icons/hicolor/256x256/apps/icy_draw.png"
  install -DTm0755 "$srcdir/usr/bin/icy_draw" "$pkgdir/usr/bin/icy_draw"
}
