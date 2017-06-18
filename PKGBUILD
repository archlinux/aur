# Maintainer: Daniel Bermond < yahoo-com: danielbermond >

pkgname=screencast
pkgver=1.2.1
pkgrel=3
pkgdesc="Command line interface to record a X11 desktop"
arch=('any')
url="https://github.com/dbermond/screencast/"
license=('GPL')
depends=('ffmpeg' 'xorg-xdpyinfo' 'libnotify')
optdepends=('bc: fade effect support'
            'imagemagick: watermark effect support'
            'oxygen-icons: desktop notification icons support'
            'sound-theme-freedesktop: sound notification support'
            'advancecomp: png (watermark) optimization support'
            'truepng: png (watermark) optimization support'
            'pingo: png (watermark) optimization support'
            'optipng: png (watermark) optimization support'
            'littleutils-full: png (watermark) optimization support')
conflicts=('screencast-git')
source=("$pkgname"-"$pkgver".tar.gz::"https://github.com/bermond/screencast/archive/v${pkgver}.tar.gz")
sha256sums=('0fec2841b1efa3a8c25e32e9a18be161714b6f9828ed6e28c3bd12719b61beeb')

package() {
	cd "$pkgname"-"$pkgver"
	gzip -9f "$pkgname".1
	install -D -m755 "$pkgname"      "${pkgdir}/usr/bin/${pkgname}"
	install -D -m644 "$pkgname".1.gz "${pkgdir}/usr/share/man/man1/${pkgname}.1.gz"
}
