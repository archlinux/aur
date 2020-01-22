# Maintainer: robertfoster

pkgname=megabasterd-bin
pkgver=7.13
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
	install -Dm644 "images/pica_roja_big.png" "$pkgdir/usr/share/pixmaps/${pkgname%%-bin}.png"
	install -Dm644 "${pkgname%%-bin}.desktop" "$pkgdir/usr/share/applications/${pkgname%%-bin}.desktop"
}

md5sums=('8280678c219705c5996e9276f9357822'
         'f4112d02ba321fbb769be50679d35357'
         'a61fc0026a70f2508514eb2107a1f79f')
