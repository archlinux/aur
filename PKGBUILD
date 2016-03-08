# Maintainer: DaarkWel <daarkwel at mail dot ru>

pkgname=ttf-pt-fonts
pkgver=2.005
pkgrel=1
arch=('any')
pkgdesc="Paratype Public Fonts (PT Sans, PT Serif, PT Mono)"
url="http://paratype.com/public/"
source=(
	"http://paratype.com/uni/public/PTSans.zip"
	"http://paratype.com/uni/public/PTSerif.zip"
	"http://paratype.com/uni/public/PTMono.zip"
)
md5sums=('b83b13d23586cf4068111e429f0db137'
'44cb0027b30ce96575ed7cca12307ac6'
'88e6767e72a02cbe8ad4c7aa09bbbd06'
)
makedepends=('p7zip')
conflicts=()
install=${pkgname}.install
license=('custom')

package() {
	mkdir -p $pkgdir/usr/share/{fonts/TTF,licenses/$pkgname}
	cd "$srcdir"
	7z -y e PTSans.zip
	install -m 0644 *.ttf $pkgdir/usr/share/fonts/TTF/
	install -m 0644 *License_*1.3.txt $pkgdir/usr/share/licenses/$pkgname/
}
