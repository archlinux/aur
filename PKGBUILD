# Maintainer: levinit <levinit@outlook.com>

pkgname=fortune-mod-zh-gushici
pkgver=1.0.0
pkgrel=5
_commit=973bf1dbda49b4e02bc09f85a09e415079b0f855
pkgdesc="Chinese poems for fortune-mod。用于fortune的中文古詩詞，收錄傳世經典詩詞、辭賦、駢文與富有韻律的短篇散文"
arch=(any)
url="https://github.com/levinit/fortune-zh-gushici"
license=('custom:public-domain')
depends=('fortune-mod')
makedepends=('opencc' 'python' 'python-yaml')
install="$pkgname.install"
source=("$pkgname-$pkgver.tar.gz::https://github.com/levinit/fortune-zh-gushici/archive/${_commit}.tar.gz"
	"$pkgname.install")
sha256sums=('0766a17cea5cf0511ef21f168a15790acae76db4256cb5ca0ab19eb94c89d892'
            'e0ed51b55622d33ce608f5ef17d4908349fb744b38795ab8f31642c9e9b0f010')

build() {
	cd "$srcdir/fortune-zh-gushici-$_commit"
	make compile
}

package() {
	cd "$srcdir/fortune-zh-gushici-$_commit"
	make install DESTDIR="$pkgdir" FORTUNE_DIR="/usr/share/fortune"
}
