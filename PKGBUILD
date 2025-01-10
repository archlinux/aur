# Maintainer: waschtl <tyrolyean@tyrolyean.net>

pkgname=icy_view-bin
pkgver=0.8.0
pkgrel=1
provides=("icy_view")
pkgdesc="Icyview is a full features ansi viewing tool doing things a bit different than other tools."
arch=('x86_64')
url="https://github.com/mkrueger/icy_tools"
license=('Apache-2.0')
makedepends=()
optdepends=()
source=("$url/releases/download/IcyView$pkgver/icy_view_linux_$pkgver.zip")
sha256sums=('0f2bcdce333a5fc4f1c6b92afd3e78ab78e3369d2108525ab78e8bf44cd6f1e2')
sha512sums=('b243f8e78d38c8336746299558d11fa9b566eeafc85909a203e61c47a4a49bab1680a09712462495910df16f9cf6ed6b4ac2c6a727bf2e8eb7b9c865ad906138')

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
