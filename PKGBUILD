# Maintainer: Han <maghsk2017@gmail.com>
# Maintainer: Bruce Zhang
pkgname=imewlconverter-bin
_name=imewlconverter
pkgver=2.9.0
pkgrel=2
pkgdesc="一款开源免费的输入法词库转换程序"
arch=('x86_64' 'i686')
url="https://github.com/studyzy/imewlconverter"
license=('GPL3')
depends=('dotnet-runtime-3.1')
provides=('imewlconverter')
conflicts=('imewlconverter')
source=(
	"$pkgname-$pkgver.src.zip::https://github.com/studyzy/imewlconverter/releases/download/v$pkgver/imewlconverter_Linux_Mac.tar.gz"
)
sha256sums=('c15d3a9dffe007235ad593cf75f2c89f44a9550a5596bc2b009745f7012434a9')

package() {
	find . -type f -exec install -Dm644 {} "$pkgdir/usr/share/imewlconverter/{}" \;
	chmod +x "$pkgdir/usr/share/imewlconverter/ImeWlConverterCmd"
	mkdir -p "$pkgdir/usr/bin"
	ln -s /usr/share/imewlconverter/ImeWlConverterCmd "$pkgdir/usr/bin/ImeWlConverterCmd"
	ln -s /usr/share/imewlconverter/ImeWlConverterCmd "$pkgdir/usr/bin/imewlconverter"
}
