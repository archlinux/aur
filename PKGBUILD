pkgname=tak
pkgver=2.3.1
pkgrel=1
pkgdesc="Tom's lossless Audio Kompressor (TAK) from official site, including tak (GUI) and takc (CLI)."
arch=(i686 x86_64)
url="http://thbeck.de/Tak/Tak.html"
license=('custom')
depends=('wine')
makedepends=()
source=("http://thbeck.de/Download/TAK_${pkgver}.zip"
	    "http://thbeck.de/Impressum.html"
        tak
        takc)
md5sums=('85ac0571d4b2b9ccdc3c5f5584a888f4'
         'SKIP'
         'f6428a9af03c245f765c1214ffc5a24d'
         '27bf5fd4e3f4927e4482c842d314254f')

build() {
	cd "$srcdir"
}

package() {
	cd "$srcdir"
	install -D -m644 Applications/Tak.exe "${pkgdir}/usr/lib/tak/tak.exe"
	install -D -m644 Applications/Takc.exe "${pkgdir}/usr/lib/tak/takc.exe"
    install -D -m755 tak "${pkgdir}/usr/bin/tak"
    install -D -m755 takc "${pkgdir}/usr/bin/takc"

	install -D -m644 Impressum.html "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.html"
}

