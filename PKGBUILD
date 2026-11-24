# Software Author: Paul Daniels <pldaniels nospamat gmail nospamdot com>
# Maintainer: Sokoloft <sokoloft nospamat protonmail nospamdot com>
# Contributor: Greyson Christoforo <grey nospamat christoforo nospamdot net>
# Contributor: piernov <piernov nospamat piernov nospamdot org>

pkgname=flexbv6-free-bin
pkgver=6.0423
pkgrel=1
pkgdesc="Free version of the FlexBV6 boardview software"
arch=("x86_64")
url="https://pldaniels.com/flexbv/"
license=("custom")
depends=('glibc' 'zlib')
conflicts=("flexbv5-bin" "flexbv6-bin" "flexbv5-free-bin")

source=("flexbv-free-${pkgver}-linux-x86_64.tar.gz::https://pldaniels.com/flexbv6/releases/flexbv-free-${pkgver}-linux-x86_64.tar.gz")

sha512sums=('3d450c9818633671b62a8ac6f8a1cc0bafe42163d327fb5185e5fe7cffd477ca8d32d46b305d78f556aa6f8996dcb9feba262e292770ce7280492a7395f2f892')
b2sums=('d907bf6926905df9f872dd91b1a79b768c094b6dcec1c145ede58c625a93b3088d4f1c49ef2837444d12995efa06a8fdb78e5e1f30095702c19becdfbe03380b')

package() {
	cd "flexbv-free-${pkgver}-linux-x86_64"
	install -Dm755 "flexbv" "${pkgdir}/usr/bin/flexbv"
	install -Dm644 "LICENCE.txt" "${pkgdir}/usr/share/licenses/flexbv/LICENCE.txt"

	cd "share"
	install -Dm644 "applications/flexbv.desktop" "${pkgdir}/usr/share/applications/flexbv.desktop"
	sed -i '/^Name=/ { /^Name\[/! s/^Name=.*/Name=FlexBV6 Free/ }' "$pkgdir/usr/share/applications/flexbv.desktop"
	install -Dm644 "icons/hicolor/scalable/apps/flexbv.svg" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/flexbv.svg"
	install -Dm644 "appdata/flexbv.appdata.xml" "${pkgdir}/usr/share/metainfo/flexbv.appdata.xml"
	install -Dm644 "mime/packages/flexbv.xml" "${pkgdir}/usr/share/mime/packages/flexbv.xml"
}
