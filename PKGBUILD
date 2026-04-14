# Software Author: Paul Daniels <pldaniels nospamat gmail nospamdot com>
# Maintainer: Sokoloft <sokoloft nospamat protonmail nospamdot com>
# Contributor: Greyson Christoforo <grey nospamat christoforo nospamdot net>
# Contributor: piernov <piernov nospamat piernov nospamdot org>

pkgname=flexbv-free-bin
pkgver=5.3093
pkgrel=1
pkgdesc="Free version of the FlexBV boardview software"
arch=("x86_64")
url="https://pldaniels.com/flexbv5/"
license=("custom")
depends=('glibc' 'zlib' 'fontconfig' 'libstdc++' 'gcc-libs')
conflicts=("flexbv-bin")

source=("flexbv-free-${pkgver}-linux-x86_64.tar.gz::https://pldaniels.com/flexbv5/releases/flexbv-free-${pkgver}-linux-x86_64.tar.gz")

sha512sums=('5dcc2c3016cd880e378aad28bd54ae1d3397b7d8314abbebaf26993b77ed02c87b2218abd42459b001d201975a5a6f998acbdba739a5a27abb2a3671d8faef65')
b2sums=('b9f7c8dd9bc70c90ee2e68e6648c6c01e483789f7024055769e6530576b4e03960619f6969b078e4552eb13afc2aff9f937611ed3cfc7678c85e7e43d494b891')

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
