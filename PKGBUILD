# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Maintainer: Alfredo Luque <me@aluque.io>
# Maintainer: Paul Mourer <paul.mourer@gmail.com>

pkgname=chrysalis-bin
_pkgname=${pkgname%-bin}
pkgdesc='Graphical configurator for Kaleidoscope-powered keyboards (AppImage)'
pkgver=0.13.2
pkgrel=1
arch=(x86_64)
url="https://github.com/keyboardio/${_pkgname^}"
license=(GPL3)
depends=(fuse2)
provides=("$_pkgname")
conflicts=("$_pkgname")
options=(!strip)
_appimage="${_pkgname^}-$pkgver-x64.AppImage"
source=("$url/releases/download/v$pkgver/$_appimage")
sha256sums=('3d6d1cbc7fbc8820ae21ddcd2538898c3dd07579b7fa69ff4c98687d35804c28')

package() {
	install -Dm0755 "$_appimage" "$pkgdir/usr/bin/$_pkgname"
}
