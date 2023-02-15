# Maintainer: lod (aur@cyber-anlage.de)

pkgname="edgetx-flasher-bin"
pkgver=0.1.0.a9c61c1
pkgrel=1
pkgdesc="The new alternative to OpenTX Companion for updating radio firmware and optimizing backups"
arch=('x86_64')
url="https://edgetx.org/"
license=('Unlicense')
makedepends=()
depends=('gtk3' 'nss' 'alsa-lib')
source=("https://github.com/EdgeTX/flasher/releases/download/latest/${pkgname%%-bin}-linux-${pkgver##*.}.deb")
sha512sums=('172ee0d4601a7893c735446b9777908f1bb1c2d9161fdaa14487ed18ecc542bcea40765f2688eccfd67deb8b6bfa5444a37d5c43d88790f88674f85c978e0d61')

package() {
	tar xf data.tar.xz -C $pkgdir
	mv $pkgdir/usr/share/icons/hicolor/0x0/ $pkgdir/usr/share/icons/hicolor/512x512/
	
	install -dm 755 $pkgdir/usr/bin
	ln -s /opt/${pkgname%%-bin}/${pkgname%%-bin} $pkgdir/usr/bin
}
