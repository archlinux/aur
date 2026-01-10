#
# Thank you to piernov & greyltc for previously maintaining.
#
# Software Author: Paul Daniels <pldaniels@gmail.com>
# Maintainer: Sokoloft <sokoloft@protonmail.com>
#

pkgname=flexbv-bin
pkgver=5.1244
pkgrel=2
pkgdesc="Visualize and interact with boardview (.brd) files."
arch=("x86_64")
url="https://pldaniels.com/flexbv5/"
license=("custom")
makedepends=("gendesk")

source=("https://pldaniels.com/flexbv5/free/FlexBVFree-${pkgver}-linux.tar.gz"
	"https://pldaniels.com/flexbv5/assets/flexbv-free-icon.svg"
	LICENSE.txt)
sha256sums=('1a12d17e64f5bd260074e5db46901e628f9ac5555e0c2b5f1b7a5db8df510b7d'
            'e19c10e335eb9ba4278317c5f0f07f25e9051f0bcd3b6bb0fb85b3b2ee73124e'
            '12f5872b4bfed1620dd57e213ac2dd18b9fe02753ef70ebc89f10b6d72244e23')

prepare() {
	gendesk -n --pkgname "flexbv" --pkgdesc "${pkgdesc}" --exec="flexbv" --name "FlexBV Free" --icon "${pkgname}.svg" --categories "Science"
}

package() {
	install -Dm644 "flexbv.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
	install -Dm644 "flexbv-free-icon.svg" "${pkgdir}/usr/share/pixmaps/${pkgname}.svg"
	install -Dm755 "FlexBVFree-${pkgver}-linux/flexbv" "${pkgdir}/usr/bin/flexbv"
	install -Dm644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
