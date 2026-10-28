# Maintainer: waschtl <tyrolyean@tyrolyean.net>

_pkgname=icy_draw
pkgname=${_pkgname}-bin
pkgver=0.6.1
pkgrel=1
groups=("icy_tools-bin")
provides=("icy_draw")
pkgdesc="IcyDraw is a full features ansi drawing tool doing things a bit different than other tools."
arch=('x86_64')
url="https://github.com/mkrueger/icy_tools"
license=('Apache-2.0')
optdepends=()
source=("$url/releases/download/IcyDraw$pkgver/icy_draw_linux_$pkgver.zip")
sha512sums=('65569095bcd4c80e2237fbacec3c88872de9fcacd93b449edfc4ae0ffeaab27b7f1085ce4bcc000aba5f70b0eb056637f462a80f8f6563fdbe50ce7cf0952950')
b2sums=('1e04b4a4bc495134e7af4f5b1dfb6d7ac653630ca7c99491816e031fab23e825a17fb4a8c4fcbb6ff91d3ba413e2c8927d74862432dde91563f076c64abfa2ce')

prepare() {
	cd "${srcdir}/"
	ar -x "icy_draw.deb"
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
