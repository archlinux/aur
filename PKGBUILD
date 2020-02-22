# Maintainer: Bruce Zhang
pkgname=imewlconverter-bin
_name=imewlconverter
pkgver=2.7.0
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
	"imewlconverter.sh"
)
sha256sums=('6f8b1903eea5fafe0c45d9ec7265a8cdce4bf397ac79a615360d97d317635de5'
            '296106ea5016fba53925eba966f9efa10563d46e570dbdd3832356a02a718247')

package() {
	cd publish
	find . -type f -exec install -Dm644 {} "$pkgdir/usr/share/imewlconverter/{}" \;
	install -Dm755 "$srcdir/imewlconverter.sh" "$pkgdir/usr/bin/imewlconverter"
}
