# Maintainer: kiwiyou <kiwiyou.dev@gmail.com>

pkgname=ttf-misaki
pkgver=2019_10_19
pkgrel=1
pkgdesc='Truetype Japanese 8x8 font supporting Gothic and Mincho.'
arch=(any)
url='https://littlelimit.net/misaki.htm'
source=("https://littlelimit.net/arc/misaki/misaki_ttf_${pkgver//_/-}.zip")
sha256sums=("a3bb61d161f1fd1bd09ea57e3a923ca54397a469d2ccba7be3119688c5024e88")
license=('custom')

build() {
	sed -n "/These fonts/,/Copyright/p" misaki.txt > LICENSE
}

package() {
	install -Dm644 -t "$pkgdir/usr/share/fonts/TTF" "misaki_gothic.ttf"
	install -Dm644 -t "$pkgdir/usr/share/fonts/TTF" "misaki_gothic_2nd.ttf"
	install -Dm644 -t "$pkgdir/usr/share/fonts/TTF" "misaki_mincho.ttf"

	install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname" "readme.txt"
	install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname" "misaki.txt"

	install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" "LICENSE"
}
