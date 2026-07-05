# Maintainer: levinit <levinit@github.com>

pkgname=fortune-mod-zh-gushici
pkgver=1.0.0
pkgrel=1
pkgdesc="Chinese poems for fortune-mod。用于fortune的中文古詩詞，收錄傳世經典詩詞、辭賦、駢文與富有韻律的短篇散文"
arch=(any)
url="https://github.com/levinit/fortune-zh-gushici"
license=('custom:public-domain')
depends=('fortune-mod')
install="$pkgname.install"
source=("$pkgname-$pkgver.tar.gz::https://github.com/levinit/fortune-zh-gushici/archive/refs/heads/main.tar.gz"
	"$pkgname.install")
sha256sums=('61ebf1a01d5e32734440bbb47af2709c4f0bf0befff9e3c84b14a7818c94fc1a'
            'e0ed51b55622d33ce608f5ef17d4908349fb744b38795ab8f31642c9e9b0f010')

package() {
	cd "$srcdir/fortune-zh-gushici-main"

	install -d "$pkgdir/usr/share/fortune"
	install -m644 data/gushici-cht "$pkgdir/usr/share/fortune/"
	install -m644 data/gushici-cht.dat "$pkgdir/usr/share/fortune/"
	install -m644 data/gushici-chs "$pkgdir/usr/share/fortune/"
	install -m644 data/gushici-chs.dat "$pkgdir/usr/share/fortune/"
}
