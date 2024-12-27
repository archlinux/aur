# Maintainer: waschtl <tyrolyean@tyrolyean.net>

pkgname=icy_draw-bin
pkgver=0.3.2
pkgrel=1
provides=("icy_draw")
pkgdesc="IcyDraw is a full features ansi drawing tool doing things a bit different than other tools."
arch=('x86_64')
url="https://github.com/mkrueger/icy_tools"
license=('Apache-2.0')
makedepends=()
optdepends=()
source=("$url/releases/download/IcyDraw$pkgver/icy_draw_linux_$pkgver.zip")
sha256sums=('2eb33d2e679556623711c6e68d1f0ceaa9e6a57fa8530814f5b0e7102aed6a02')
sha512sums=('4d20e7c8dcf83cea6cac2c63c5f7f86ae4bc27b34cc7e98508e0b0661afac45a0d1beafd1df06fa4f10287eb8664d0f8bd6369d268978965c264da4c2e7f435f')

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
