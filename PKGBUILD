# Maintainer: waschtl <tyrolyean@tyrolyean.net>

pkgname=icy_view-bin
pkgver=0.8.1
pkgrel=1
provides=("icy_view")
pkgdesc="Icyview is a full features ansi viewing tool doing things a bit different than other tools."
arch=('x86_64')
url="https://github.com/mkrueger/icy_tools"
license=('Apache-2.0')
makedepends=()
optdepends=()
source=("$url/releases/download/IcyView$pkgver/icy_view_linux_$pkgver.zip")
sha256sums=('a36d90b7557172334f9f51482ac2a62fa4c0592cddb06e15f7b8de1a4ea5637a')
sha512sums=('68ecde8434d40c95d242b3043d86235af85a98c8c6dd6a81a8b5e98749801105f36a2d8d3f7bfb1b7bac5f9a6bc7194eefb1f77f5ec4b41378eaeaec4c1b6af2')

prepare() {
	cd "${srcdir}/"
	ar -x "icy_view.deb"
	bsdtar -xvf data.tar.xz
}

package() {
  cd "${srcdir}/"
  install -DTm0755 "$srcdir/usr/share/doc/icy-view/copyright" "$pkgdir/usr/share/doc/icy-view/copyright"
  install -DTm0755 "$srcdir/usr/share/applications/icy_view.desktop" "$pkgdir/usr/share/applications/icy_view.desktop"
  install -DTm0755 "$srcdir/usr/share/icons/hicolor/128x128/apps/icy_view.png" "$pkgdir/usr/share/icons/hicolor/128x128/apps/icy_view.png"
  install -DTm0755 "$srcdir/usr/share/icons/hicolor/256x256/apps/icy_view.png" "$pkgdir/usr/share/icons/hicolor/256x256/apps/icy_view.png"
  install -DTm0755 "$srcdir/usr/bin/icy_view" "$pkgdir/usr/bin/icy_view"
}
