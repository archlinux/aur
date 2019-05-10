# Maintainer: Bruce Zhang
pkgname=imewlconverter-bin
_name=imewlconverter
pkgver=2.5
pkgrel=1
pkgdesc="一款开源免费的输入法词库转换程序"
arch=('x86_64' 'i686')
url="https://github.com/studyzy/imewlconverter"
license=('GPL3')
depends=('dotnet-runtime')
provides=('imewlconverter')
conflicts=('imewlconverter')
source=(
	"$pkgname-$pkgver.src.tar.gz::https://github.com/studyzy/imewlconverter/releases/download/v$pkgver/Release_V${pkgver}_Linux_macOS.tar.gz"
	"imewlconverter.sh"
)
sha256sums=('68bfa97f1b4970e44859d3374ffad71dbf105925ef0b552e8763553ac2aa89dc'
            '296106ea5016fba53925eba966f9efa10563d46e570dbdd3832356a02a718247')

package() {
	cd publish
	find . -type f -exec install -Dm644 {} "$pkgdir/usr/share/imewlconverter/{}" \;
	install -Dm755 "$srcdir/imewlconverter.sh" "$pkgdir/usr/bin/imewlconverter"
}
