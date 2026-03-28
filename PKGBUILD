# Software Author: Paul Daniels <pldaniels nospamat gmail nospamdot com>
# Maintainer: Sokoloft <sokoloft nospamat protonmail nospamdot com>
# Contributor: Greyson Christoforo <grey nospamat christoforo nospamdot net>
# Contributor: piernov <piernov nospamat piernov nospamdot org>

pkgname=flexbv-free-bin
pkgver=5.1383
pkgrel=2
pkgdesc="Visualize and interact with boardview (.brd) files."
arch=("x86_64")
url="https://pldaniels.com/flexbv5/"
license=("custom")
makedepends=("gendesk")
depends=("glibc" "gcc-libs" "zlib" "fontconfig" "gtk3" "glib2")

source=("flexbv-free-${pkgver}.tar.gz::https://pldaniels.com/flexbv5/free/FlexBVFree-${pkgver}-linux.tar.gz"
	"flexbv-free-icon.svg::https://pldaniels.com/flexbv5/assets/flexbv-free-icon.svg"
	LICENSE.txt)

sha512sums=('ee835bd081e3c743cdd311186f348f47488a92973783496f4e52f3ea44ee67634e7d9506c4abba55fd2419dfa017c7e8a86efca8bcde9a080ad2dacc87e63512'
            '43e953f9828689ced7f405aacbd2a73d35ef14056c71b5c6ad340bfbe154a5118da082f2947f66ddd5ddf406c0f50c00ba1adf6743ba2509457c1681f7c1b9da'
            '59a94b3310a23c5a8e365e24efe35e70178315d1380aace442b3173fc3245d8f2b6bf90c58939854084afcfcd9c541bb1376e8b1387d00e5829ff5ecc460088a')
b2sums=('e56e076fb39d2c403a894f12210e3f95cdd2fa6203dce121fd73ab0a23360183785b987bdcb23f768d9c035f8a8bd2425d8de8e5eb797c58f416fe87313d2655'
        '241e8a0e39c968a79331dd6949a64d7b2a7ae8a8d1aab95ed99fa856c2b7eba099084ca617345e522f51da323562038c5392a43808a471a337ebe3183faab3d8'
        '1acf0bb1e9d993edd94338ff377d3907e6fb9251747676ca41e828bec059c58564ef7730e03f11ca85d160a39b55e0e38f20020fa6d2b3ffd17b97a322805afa')

prepare() {
	gendesk -n --pkgname "flexbv" --pkgdesc "${pkgdesc}" --exec="flexbv" --name "FlexBV Free" --icon "${pkgname}.svg" --categories "Science" --terminal=false --custom="Keywords=Boardview;"
}

package() {
	install -Dm755 "FlexBVFree-${pkgver}-linux/flexbv" "${pkgdir}/usr/bin/flexbv"
	install -Dm644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	install -Dm644 "flexbv.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
	install -Dm644 "flexbv-free-icon.svg" "${pkgdir}/usr/share/pixmaps/${pkgname}.svg"
}
