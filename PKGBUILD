# Maintainer: waschtl <tyrolyean@tyrolyean.net>

pkgname=icy_view-bin
pkgver=0.9.10
pkgrel=1
provides=("icy_view")
pkgdesc="Icyview is a full features ansi viewing tool doing things a bit different than other tools."
arch=('x86_64')
url="https://github.com/mkrueger/icy_tools"
license=('Apache-2.0')
makedepends=()
optdepends=()
source=("$url/releases/download/IcyView$pkgver/icy_view_linux_$pkgver.zip")
sha512sums=('06ff3f571825a48c7ea0df07f243db2240aae651aa51ce4236567ace4c7bb19c8857c57194c398f2a90128517de3c84e09085440397bb80193155191548fa2cb')
b2sums=('a930761fd86643cc5233d83a9fee2c0276de8957d2d017f25e5c538dadfc91818da6be2edea25f3ca9be0ca781f967f5598b67369c7f212e90967a263ce33dd4')
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
