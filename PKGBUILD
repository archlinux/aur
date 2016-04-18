# Contributor: Gerald Nunn <gerald dot b dot nunn at gmail dot com>
# Maintainer: Davi da Silva Böger <dsboger at gmail dot com>

pkgname=terminix
pkgver=0.58.0
pkgrel=1
pkgdesc="A tiling terminal emulator based on GTK+ 3 (binary distribution)"
arch=('x86_64')
url="http://github.com/gnunn1/terminix"
license=('MPL')
depends=('gtk3' 'dconf' 'gsettings-desktop-schemas' 'vte3')
optdepends=('python2-nautilus: for "Open Terminix Here" support in nautilus')
install=terminix.install
source_x86_64=(${pkgname}-${pkgver}.zip::https://github.com/gnunn1/terminix/releases/download/$pkgver/terminix.zip)
sha512sums_x86_64=('1bf21f0bb8262372b45735ac9187056b3e85cad2f9138c31369397fb67fdf6ebbab474896e61071625e5c5d435d404479a464489a69fa13f73024cb3375a61f8')

package() {
	cp -ar $srcdir/usr $pkgdir/usr
	# Fix for bug in install.sh
	mv $pkgdir/usr/share/appdata $pkgdir/usr/share/com.gexperts.Terminix.appdata.xml
	mkdir $pkgdir/usr/share/appdata
	mv $pkgdir/usr/share/com.gexperts.Terminix.appdata.xml $pkgdir/usr/share/appdata/
}
