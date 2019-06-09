pkgname=tak
pkgver=2.3.0
pkgrel=2
pkgdesc="Tom's lossless Audio Kompressor (TAK) from official site, including tak (GUI) and takc (CLI)."
arch=(i686 x86_64)
url="http://thbeck.de/Tak/Tak.html"
license=('custom')
depends=('wine')
makedepends=()
source=("http://thbeck.de/Download/TAK_${pkgver}.zip"
	"http://thbeck.de/Impressum.html"
        tak takc)
md5sums=('b503af1b39e39429eb00ac13878c6a8f'
         'SKIP'
         '06236173635d79e7efbf864030f2c4cd'
         '4cc05b24ebcde8ed15504f844f8431ff')

prepare() {
	cd "$srcdir"
}

build() {
	cd "$srcdir"
}

check() {
	cd "$srcdir"
}

package() {
	cd "$srcdir"
	mkdir ${pkgdir}/usr
	mkdir ${pkgdir}/usr/bin
	mkdir ${pkgdir}/usr/share
	mkdir ${pkgdir}/usr/share/tak
	cp -f Applications/Tak.exe ${pkgdir}/usr/share/tak/tak.exe
        cp -f tak ${pkgdir}/usr/bin/
        cp -f Applications/Takc.exe ${pkgdir}/usr/share/tak/takc.exe
        cp -f takc ${pkgdir}/usr/bin/
        chmod +x ${pkgdir}/usr/bin/tak ${pkgdir}/usr/bin/takc

	install -D -m644 Impressum.html "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.html"
}

