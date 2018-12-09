# Maintainer: robertfoster

pkgname=megabasterd-bin
pkgver=5.76
pkgrel=1
pkgdesc="Yet another (unofficial) cross-platform MEGA downloader/uploader/streaming suite"
arch=('any')
url="https://github.com/tonikelope/megabasterd"
license=('GPL3')
depends=('java-runtime')
source=("https://github.com/tonikelope/megabasterd/releases/download/v$pkgver/MegaBasterd_$pkgver.jar"
	"${pkgname%%-bin}.sh"
	"${pkgname%%-bin}.desktop"
)

package() {
	cd "$srcdir"
	mkdir -p "$pkgdir/usr/share/java/${pkgname%%-bin}"
	cp "MegaBasterd_$pkgver.jar" "$pkgdir/usr/share/java/${pkgname%%-bin}/${pkgname%%-bin}.jar"
	install -Dm755 "${pkgname%%-bin}.sh" "$pkgdir/usr/bin/${pkgname%%-bin}"
	install -Dm644 "images/mbasterd_med.png" "$pkgdir/usr/share/pixmaps/${pkgname%%-bin}.png"
	install -Dm644 "${pkgname%%-bin}.desktop" "$pkgdir/usr/share/applications/${pkgname%%-bin}.desktop"
}

md5sums=('5e9d7d9adc83b698652a34726f46371b'
	'f4112d02ba321fbb769be50679d35357'
'b746134d9f4c90ae2458177c85041df8')
