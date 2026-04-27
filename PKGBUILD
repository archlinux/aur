# Software Author: Paul Daniels <pldaniels nospamat gmail nospamdot com>
# Maintainer: Sokoloft <sokoloft nospamat protonmail nospamdot com>
# Contributor: Greyson Christoforo <grey nospamat christoforo nospamdot net>
# Contributor: piernov <piernov nospamat piernov nospamdot org>

pkgname=flexbv-free-bin
pkgver=5.3127
pkgrel=1
pkgdesc="Free version of the FlexBV boardview software"
arch=("x86_64")
url="https://pldaniels.com/flexbv5/"
license=("custom")
depends=('glibc' 'zlib' 'fontconfig' 'libstdc++' 'gcc-libs')
conflicts=("flexbv-bin")

source=("flexbv-free-${pkgver}-linux-x86_64.tar.gz::https://pldaniels.com/flexbv5/releases/flexbv-free-${pkgver}-linux-x86_64.tar.gz")

sha512sums=('035b41dc1601dfcf711c430028b584835a028544effe146062ce86e8bf148f50f569c8be13ba1f9d5e80b65444b92b2ecde393a30af0ccb49a734c9a57122734')
b2sums=('26a617f6fbeb51801a4a42366e3b31809f60be289351fbffb5bce47104febc75f03d883acf1cff37b1f6e483c67d94d71db4491864e4e9b5e982acab167d74e2')

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
