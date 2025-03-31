# Maintainer: drakosstar <drakos_main@outlook.com>
# Contributor: GPereira <goncalo_pereira@outlook.pt>
# Contributor: mibu <mib@kanp.ai>
pkgname=lightburn-bin
pkgver=1.7.08
pkgrel=1
pkgdesc="A layout, editing, and control software for lasercutters."
arch=('x86_64')
url="https://lightburnsoftware.com"
license=('unknown')
depends=('qt5-multimedia' 'qt5-serialport')
makedepends=()
provides=("${pkgname}")
conflicts=("${pkgname}")
options=('!strip')
source=('lightburn.sh' 'lightburn.desktop' "https://release.lightburnsoftware.com/LightBurn/Release/LightBurn-v$pkgver/LightBurn-Linux64-v$pkgver.7z")
sha256sums=('da8104be7ff99f86f92b42281bc81aef35cc05140de450d17a7fd298595f8ff8'
            'f72e86774d4396240b46e07e947edf9cdf5f8d526a70129c447fed7c173c4867'
            '746fc0dfdfd26a9c92e86192282b0752f60df8238dba5fece791d38bd09ce7d8')

package() {
	mkdir -p "$pkgdir/opt/lightburn"
	cp -r "$srcdir/LightBurn"/* "$pkgdir/opt/lightburn"

	install -Dm755 "$srcdir/lightburn.sh" "$pkgdir/usr/bin/lightburn"
	install -Dm644 "lightburn.desktop" "$pkgdir/usr/share/applications/lightburn.desktop"
	install -Dm755 "$srcdir/LightBurn/LightBurn.png" "$pkgdir/usr/share/pixmaps/lightburn.png"
}
