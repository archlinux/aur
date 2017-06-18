# Maintainer: Daniel Bermond < yahoo-com: danielbermond >

pkgname=screencast
pkgver=1.3.0
pkgrel=1
pkgdesc='Command line interface to record a X11 desktop'
arch=('any')
url='https://github.com/dbermond/screencast/'
license=('GPL')
depends=('ffmpeg' 'xorg-xdpyinfo' 'libnotify')
optdepends=('slop: graphical screen region selection support'
            'bc: fade effect support'
            'imagemagick: watermark effect support'
            'oxygen-icons: desktop notification icons support'
            'sound-theme-freedesktop: sound notification support'
            'advancecomp: png (watermark) optimization support'
            'truepng: png (watermark) optimization support'
            'pingo: png (watermark) optimization support'
            'optipng: png (watermark) optimization support'
            'littleutils-full: png (watermark) optimization support')
conflicts=('screencast-git')
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/bermond/screencast/archive/v${pkgver}.tar.gz")
sha256sums=('ad3fd51cca387cb57af6a1aec93e651f631221193c7928a60f81787bde4f18fc')

package() {
    cd "${pkgname}-${pkgver}"
    gzip -9f "${pkgname}.1"
    install -D -m755 "$pkgname"        "${pkgdir}/usr/bin/${pkgname}"
    install -D -m644 "${pkgname}.1.gz" "${pkgdir}/usr/share/man/man1/${pkgname}.1.gz"
}
