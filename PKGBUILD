# Maintainer: levinit <levinit@github.com>

pkgname=fortune-mod-zh-gushici
pkgver=1.0.0
pkgrel=4
_commit=85949971cc09e580285179ee970bed4aaa65fb8b
pkgdesc="Chinese poems for fortune-mod。用于fortune的中文古詩詞，收錄傳世經典詩詞、辭賦、駢文與富有韻律的短篇散文"
arch=(any)
url="https://github.com/levinit/fortune-zh-gushici"
license=('custom:public-domain')
depends=('fortune-mod')
makedepends=('opencc' 'python' 'python-yaml')
install="$pkgname.install"
source=("$pkgname-$pkgver.tar.gz::https://github.com/levinit/fortune-zh-gushici/archive/${_commit}.tar.gz"
	"$pkgname.install")
sha256sums=('6fd07f5f7690edd629ea66edf3fdeb22106f7ef2742abe38ca967cc8a3aa5207'
            'e0ed51b55622d33ce608f5ef17d4908349fb744b38795ab8f31642c9e9b0f010')

build() {
	cd "$srcdir/fortune-zh-gushici-$_commit"
	make compile
}

package() {
	cd "$srcdir/fortune-zh-gushici-$_commit"
	make install DESTDIR="$pkgdir" FORTUNE_DIR="/usr/share/fortune"
}
