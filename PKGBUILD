# Maintainer: Maximilian Berger <snowdragon92[at]gmail[dotcom]>
pkgname=tiddlydesktop
pkgver=0.0.4
pkgrel=1
pkgdesc="TiddlyDesktop is a special purpose web browser for working with locally stored TiddlyWikis."
url="https://github.com/Jermolene/TiddlyDesktop"
license=('BSD')
provides=('tiddlydesktop')
depends=('libudev.so.0')
optdepends=('tiddlywiki: empty tiddlywiki file and utility script')

arch=('x86_64' 'i686')

source_i686=(https://github.com/Jermolene/TiddlyDesktop/releases/download/v0.0.4/tiddlydesktop-linux32-0.0.4.zip)
source_x86_64=(https://github.com/Jermolene/TiddlyDesktop/releases/download/v0.0.4/tiddlydesktop-linux64-0.0.4.zip)
source=(tiddlydesktop.sh
		tiddlydesktop.desktop)

sha256sums_x86_64=('2c05c63ee6cebb2f9e0494cd5526ba471650a8db011b7d6742c99b3421faed3c')
sha256sums_i686=('e161dec2e79a704b3e99521c887b9ca20944527a95c6931212a6e2d9270749ea')
sha256sums=('ec5826348934f45ba28209f00a96073876910aec3bc1bc5e7c6cc68216099998'
            '58481ee296f39ac95760fffc947bf36c3ccbea73bdcde7d224102109e90cd0de')

package() {
	cd "$srcdir"
	install -d "${pkgdir}/usr/share/${pkgname}"

	cp -r . "${pkgdir}/usr/share/$pkgname"
	chmod -R 775 "${pkgdir}/usr/share/$pkgname"

  	install -Dm755 "tiddlydesktop.sh" 					"${pkgdir}/usr/bin/$pkgname"

    install -Dm644 "${srcdir}/tiddlydesktop.desktop" 	"${pkgdir}/usr/share/applications/tiddlydesktop.desktop"
  	install -Dm644 "${srcdir}/images/Motovun Jack.svg" 	"${pkgdir}/usr/share/pixmaps/tiddlydesktop.svg"
}
