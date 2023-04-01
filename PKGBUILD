# Maintainer: lod (aur@cyber-anlage.de)

pkgname="edgetx-flasher-bin"
pkgver=0.1.0.fc30bac
pkgrel=1
pkgdesc="The new alternative to OpenTX Companion for updating radio firmware and optimizing backups"
arch=('x86_64')
url="https://edgetx.org/"
license=('Unlicense')
makedepends=()
depends=('gtk3' 'nss' 'alsa-lib')
source=("https://github.com/EdgeTX/flasher/releases/download/latest/${pkgname%%-bin}-linux-${pkgver##*.}.deb")
sha512sums=('162525bbb1fa4c94e66dee2507ccb490c5b89a660d74f71685b7bbc46216387b8df77864e7a5d0788ef0a5b51abbac4161a8929833f0d2877e6b5b7e75303267')

package() {
	tar xf data.tar.xz -C $pkgdir
	mv $pkgdir/usr/share/icons/hicolor/0x0/ $pkgdir/usr/share/icons/hicolor/512x512/
	
	install -dm 755 $pkgdir/usr/bin
	ln -s /opt/${pkgname%%-bin}/${pkgname%%-bin} $pkgdir/usr/bin
}
