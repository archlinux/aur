# Software Author: Paul Daniels <pldaniels nospamat gmail nospamdot com>
# Maintainer: Sokoloft <sokoloft nospamat protonmail nospamdot com>
# Contributor: Greyson Christoforo <grey nospamat christoforo nospamdot net>
# Contributor: piernov <piernov nospamat piernov nospamdot org>

pkgname=flexbv-free-bin
pkgver=5.3106
pkgrel=1
pkgdesc="Free version of the FlexBV boardview software"
arch=("x86_64")
url="https://pldaniels.com/flexbv5/"
license=("custom")
depends=('glibc' 'zlib' 'fontconfig' 'libstdc++' 'gcc-libs')
conflicts=("flexbv-bin")

source=("flexbv-free-${pkgver}-linux-x86_64.tar.gz::https://pldaniels.com/flexbv5/releases/flexbv-free-${pkgver}-linux-x86_64.tar.gz")

sha512sums=('838398be7972c33e730efec25431bafadaffa46a2c452e98b92c5d08b39e16736c564b14d5060b37f06f692efe76358ea9bb921f3197b9c126364705a1cd6cb4')
b2sums=('f7586ac5f4eec73fbd355effce604e9927276bc2d780936d69fd5e0d5a97b718eb97a80f41cce6c831d6666adbc45c74efdd25e6943777777b91ef24a0b7afc9')

package() {
	cd "flexbv-free-${pkgver}-linux-x86_64"
	install -Dm755 "flexbv" "${pkgdir}/usr/bin/flexbv"
	install -Dm644 "LICENCE.txt" "${pkgdir}/usr/share/licenses/flexbv/LICENCE.txt"

	cd "share"
	install -Dm644 "applications/flexbv.desktop" "${pkgdir}/usr/share/applications/flexbv.desktop"
	sed -i '/^Name=/ { /^Name\[/! s/^Name=.*/Name=FlexBV Free/ }' "$pkgdir/usr/share/applications/flexbv.desktop"
	install -Dm644 "icons/hicolor/scalable/apps/flexbv.svg" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/flexbv.svg"
	install -Dm644 "appdata/flexbv.appdata.xml" "${pkgdir}/usr/share/metainfo/flexbv.appdata.xml"
	install -Dm644 "mime/packages/flexbv.xml" "${pkgdir}/usr/share/mime/packages/flexbv.xml"
}
