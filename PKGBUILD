# Maintainer: Daniel Bermond < yahoo-com: danielbermond >

pkgname=screencast
pkgver=1.1.0
pkgrel=1
pkgdesc="Command line interface to record a X11 desktop"
arch=('i686' 'x86_64')
url="https://github.com/bermond/screencast/"
license=('GPL2')
depends=('ffmpeg')
optdepends=('bc: fade effect support'
            'imagemagick: watermark effect support'
            'libnotify: desktop notification support'
            'oxygen-icons: desktop notification icons support'
            'sound-theme-freedesktop: sound notification support'
            'advancecomp: png (watermark) optimization support'
            'truepng: png (watermark) optimization support'
            'pingo: png (watermark) optimization support'
            'optipng: png (watermark) optimization support'
            'littleutils-full: png (watermark) optimization support')
conflicts=('screencast-git')
source=("$pkgname"-"$pkgver".tar.gz::"https://github.com/bermond/screencast/archive/v${pkgver}.tar.gz")
sha256sums=('6f93975a4f7903d7d7a95bba7f3f9861a2c7292ccfd16bc4ff132d9715feca77')

package() {
	cd "$pkgname"-"$pkgver"
	gzip -9f "$pkgname".1
	install -D -m755 "$pkgname"      "${pkgdir}/usr/bin/${pkgname}"
	install -D -m644 "$pkgname".1.gz "${pkgdir}/usr/share/man/man1/${pkgname}.1.gz"
}
