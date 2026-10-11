# Maintainer: waschtl <tyrolyean@tyrolyean.net>

pkgname=icy_view-bin
pkgver=0.9.9
pkgrel=1
provides=("icy_view")
pkgdesc="Icyview is a full features ansi viewing tool doing things a bit different than other tools."
arch=('x86_64')
url="https://github.com/mkrueger/icy_tools"
license=('Apache-2.0')
makedepends=()
optdepends=()
source=("$url/releases/download/IcyView$pkgver/icy_view_linux_$pkgver.zip")
sha512sums=('1040b7ae831a1fc1a55077271ba41e037dc9b1c2e178203d45ac997ee1f30381d922da85a126caf8eca8e39548c815fb4d449adcc0d6fddde367dc7b4561fbbc')
b2sums=('32517f00957ec5b7ae51cc8eee1bf495feef55d07da533add9edfa5fa2830a71c8ccdc8faf98ec985f1276b60cca81438a456daaffa50296f352e9fac60b68f0')
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
