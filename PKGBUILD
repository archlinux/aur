# Maintainer: Diab Neiroukh <officiallazerl0rd@gmail.com>

pkgbase="ttf-inter"
pkgname=("ttf-inter" "ttf-inter-display")
pkgver=3.13
pkgrel=1
epoch=1
arch=("any")
url="https://rsms.me/inter"
license=("custom")
depends=("fontconfig")
makedepends=("unzip")
source=(
	"https://github.com/rsms/inter/releases/download/v3.13/Inter-3.13.zip"
	"https://github.com/rsms/inter/releases/download/display-beta-1/Inter-3.13-display-5e8095f9ba.zip")
b2sums=(
	"d8630d083529f23ffdc92d4bad9b08ded1060d379cfe82aacc50e513d69bb51c7b6dc226ad10133a8781e9edceddc03fde665dc586c07863cf2c6faeb6e266d7"
	"cd84c5251a6bdc7e973d08635815aa3af1f688d24376d3d2d2ffc52fca25dea84308e9b9d2133bb859447835cb32d47c471910ef61ccdc5e3573e6b1960ecd78")
noextract=(
	"Inter-3.13.zip"
	"Inter-3.13-display-5e8095f9ba.zip"
)

prepare()
{
	install -d "Inter"
	unzip "Inter-3.13.zip" -d "Inter"

	install -d "Inter Display"
	unzip "Inter-3.13-display-5e8095f9ba.zip" -d "Inter Display"
}

package_ttf-inter()
{
	pkgname="ttf-inter"
	pkgdesc="A typeface carefully crafted & designed for computer screens"

	cd "Inter"
	install -D -m644 "LICENSE.txt" "${pkgdir}/usr/share/licenses/Inter/LICENSE"

	cd "Inter Desktop"
	rm "Inter-V.otf"
	install -D -m644 *".otf" "${pkgdir}/usr/share/fonts/opentype"
}

package_ttf-inter-display()
{
	pkgname="ttf-inter-display"
	pkgdesc="A new \"display\" variant of Inter"

	cd "Inter Display"
	install -D -m644 "LICENSE.txt" "${pkgdir}/usr/share/licenses/Inter Display/LICENSE"

	cd "Inter Desktop"
	rm "InterDisplay-V.otf"
	install -D -m644 *".otf" "${pkgdir}/usr/share/fonts/opentype"
}
