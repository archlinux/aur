# Software Author: Paul Daniels <pldaniels nospamat gmail nospamdot com>
# Maintainer: Sokoloft <sokoloft nospamat protonmail nospamdot com>
# Contributor: Greyson Christoforo <grey nospamat christoforo nospamdot net>
# Contributor: piernov <piernov nospamat piernov nospamdot org>

pkgname=flexbv-free-bin
pkgver=5.3175
pkgrel=1
pkgdesc="Free version of the FlexBV boardview software"
arch=("x86_64")
url="https://pldaniels.com/flexbv5/"
license=("custom")
depends=('glibc' 'zlib' 'fontconfig' 'libstdc++' 'gcc-libs')
conflicts=("flexbv-bin")

source=("flexbv-free-${pkgver}-linux-x86_64.tar.gz::https://pldaniels.com/flexbv5/releases/flexbv-free-${pkgver}-linux-x86_64.tar.gz")

sha512sums=('a764567df5e9b262d0b564a0216837a7e85c5f00b52b748f79f204a29fa4e7620bb622c21be76c02315bef1cf1c17e6b6d012aabdda1abd03a1235dce9f1e404')
b2sums=('e59e29ed557649cbf8f04ee3cf6a68d212219051df5ba2bd9b699a74fb495da1f383e18a81856f7bed492de3d64d825e388846cd6a48b3d1d251c299c46d9982')

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
