# Maintainer: Bruce Zhang
pkgname=imewlconverter-bin
_name=imewlconverter
pkgver=2.8.0
pkgrel=1
pkgdesc="一款开源免费的输入法词库转换程序"
arch=('x86_64' 'i686')
url="https://github.com/studyzy/imewlconverter"
license=('GPL3')
depends=('dotnet-runtime')
provides=('imewlconverter')
conflicts=('imewlconverter')
source=(
	"$pkgname-$pkgver.src.zip::https://github.com/studyzy/imewlconverter/releases/download/v$pkgver/imewlconverter_Linux_Mac.tar.gz"
)
sha256sums=('baab38d7439fd399eced6810ddd4fb8193a064a8c39ab79313a05a579b9cfae8')

package() {
	find . -type f -exec install -Dm644 {} "$pkgdir/usr/share/imewlconverter/{}" \;
	chmod +x "$pkgdir/usr/share/imewlconverter/ImeWlConverterCmd"
	mkdir -p "$pkgdir/usr/bin"
	ln -s /usr/share/imewlconverter/ImeWlConverterCmd "$pkgdir/usr/bin/ImeWlConverterCmd"
	ln -s /usr/share/imewlconverter/ImeWlConverterCmd "$pkgdir/usr/bin/imewlconverter"
}
