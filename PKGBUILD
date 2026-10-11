# Maintainer: waschtl <tyrolyean@tyrolyean.net>

_pkgname=icy_draw
pkgname=${_pkgname}-bin
pkgver=0.6.0
pkgrel=1
groups=("icy_tools-bin")
provides=("icy_draw")
pkgdesc="IcyDraw is a full features ansi drawing tool doing things a bit different than other tools."
arch=('x86_64')
url="https://github.com/mkrueger/icy_tools"
license=('Apache-2.0')
optdepends=()
source=("$url/releases/download/IcyDraw$pkgver/icy_draw_linux_$pkgver.zip")
sha512sums=('edaa66be4e734c2fdc2ddacb9efea456890ba02e65371b8b822ac2d650cdab10080cbee4565b91ee380f7578da19e2be528dc5e9520caba7e5ee16b76e14961a')
b2sums=('0bb54bef0fbccd821faf76a992c5d08e5ac61d04a1595749bb289c70d17785eb42a129d600cabfd55f8f36bec692140c487746db8609265bfbd1c5b8d157088f')

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
