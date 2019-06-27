# Maintainer: Bruce Zhang
pkgname=imewlconverter-bin
_name=imewlconverter
pkgver=2.6
pkgrel=1
pkgdesc="一款开源免费的输入法词库转换程序"
arch=('x86_64' 'i686')
url="https://github.com/studyzy/imewlconverter"
license=('GPL3')
depends=('dotnet-runtime')
provides=('imewlconverter')
conflicts=('imewlconverter')
source=(
	"$pkgname-$pkgver.src.zip::https://github.com/studyzy/imewlconverter/releases/download/V$pkgver/Release_V${pkgver}_Linux_MacOS.zip"
	"imewlconverter.sh"
)
sha256sums=('a5ac8dc1ff875a3d99e17ef56fceb6dcdd6425a744791c9e22f4e1fe9885927f'
            '296106ea5016fba53925eba966f9efa10563d46e570dbdd3832356a02a718247')

package() {
	cd publish
	find . -type f -exec install -Dm644 {} "$pkgdir/usr/share/imewlconverter/{}" \;
	install -Dm755 "$srcdir/imewlconverter.sh" "$pkgdir/usr/bin/imewlconverter"
}
