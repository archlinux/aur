# Maintainer: Diab Neiroukh <officiallazerl0rd@gmail.com>
# Contributor: Ward Segers <w@rdsegers.be>

pkgname=otf-inter
pkgver=3.13
pkgrel=1
epoch=1
pkgdesc="Inter is a typeface carefully crafted & designed for computer screens"
arch=(
	"any"
)
conflicts=(
	"inter-font"
)
url="https://github.com/rsms/inter"
license=(
	"custom"
)
depends=(
	"fontconfig"
	"xorg-font-utils"
)
source=(
	"https://github.com/rsms/inter/releases/download/v$pkgver/Inter-$pkgver.zip"
	)
b2sums=(
	"d8630d083529f23ffdc92d4bad9b08ded1060d379cfe82aacc50e513d69bb51c7b6dc226ad10133a8781e9edceddc03fde665dc586c07863cf2c6faeb6e266d7"
)

package()
{
	install -D -m644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

	cd "Inter Desktop" || exit
	install -d "${pkgdir}/usr/share/fonts/OTF"
	install -m644 *".otf" "${pkgdir}/usr/share/fonts/OTF/"
}
