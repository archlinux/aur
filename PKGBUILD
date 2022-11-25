# Maintainer: lod (aur@cyber-anlage.de)

pkgname="edgetx-flasher-bin"
pkgver=0.1.0.629b68c
pkgrel=1
pkgdesc="The new alternative to OpenTX Companion for updating radio firmware and optimizing backups"
arch=('x86_64')
url="https://edgetx.org/"
license=('Unlicense')
makedepends=()
depends=('gtk3' 'nss' 'alsa-lib')
source=("https://github.com/EdgeTX/flasher/releases/download/latest/${pkgname%%-bin}-linux-${pkgver##*.}.deb")
sha512sums=('53063c656d4cc2c228c5d94d773e46d57879fef7a2515bf56e1a62f937d2ca462b4479dc98a667f1a5488e6748468baa02700a30ba770dd3cf46343d7d10282f')

package() {
	tar xf data.tar.xz -C $pkgdir
	mv $pkgdir/usr/share/icons/hicolor/0x0/ $pkgdir/usr/share/icons/hicolor/512x512/
	
	install -dm 755 $pkgdir/usr/bin
	ln -s /opt/${pkgname%%-bin}/${pkgname%%-bin} $pkgdir/usr/bin
}
