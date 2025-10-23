# Maintainer: waschtl <tyrolyean@tyrolyean.net>

_pkgname=icy_draw
pkgname=${_pkgname}-bin
pkgver=0.4.2
pkgrel=1
groups=("icy_tools-bin")
provides=("icy_draw")
pkgdesc="IcyDraw is a full features ansi drawing tool doing things a bit different than other tools."
arch=('x86_64')
url="https://github.com/mkrueger/icy_tools"
license=('Apache-2.0')
optdepends=()
source=("$url/releases/download/IcyDraw$pkgver/icy_draw_linux_$pkgver.zip")
sha256sums=('7170852af07231497f8ab12e40eadf4bd0f5e44fef78de71b477b9d9e612d02f')
sha512sums=('557a922c92bc5e64d7bafd99f15f05c00d6e18db718783219f67c9c915ba934e3ac47052d559054becab23d8829c9696a0697de537796e724f04cfd4805566f7')

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
