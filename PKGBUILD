# Maintainer: waschtl <tyrolyean@tyrolyean.net>

pkgname=icy_view-bin
pkgver=0.7.1
pkgrel=1
provides=("icy_view")
pkgdesc="Icyview is a full features ansi viewing tool doing things a bit different than other tools."
arch=('x86_64')
url="https://github.com/mkrueger/icy_tools"
license=('Apache-2.0')
makedepends=()
optdepends=()
source=("$url/releases/download/IcyView$pkgver/icy_view_linux_$pkgver.zip")
sha256sums=('a472f67ca940959c59de3a000473e4b7cb99813e366007520b6f8b5d83876b39')
sha512sums=('cdcf7b5b641cf2904217018ce740cbcf67ea5174c0e4e24f1665d2b9d86de32e9c79df0fc0d469aa0a9a9f82547c66ef1fee52b2dcee7e049ad911d46f2ff1ea')

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
