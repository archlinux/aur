# Maintainer: Daniel Bermond < yahoo-com: danielbermond >

pkgname=screencast
pkgver=1.3.0
pkgrel=2
pkgdesc='Command line interface to record a X11 desktop'
arch=('any')
url='https://github.com/dbermond/screencast/'
license=('GPL')
depends=('ffmpeg' 'xorg-xdpyinfo' 'libnotify' 'oxygen-icons')
optdepends=('bc: fade effect support'
            'imagemagick: watermark effect support'
            'slop: graphical screen region selection support'
            'sound-theme-freedesktop: sound notification support'
            'truepng: watermark optimization support'
            'pingo: watermark optimization support'
            'optipng: watermark optimization support'
            'littleutils-full: watermark optimization support'
            'advancecomp: watermark optimization support')
conflicts=('screencast-git')
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/bermond/screencast/archive/v${pkgver}.tar.gz")
sha256sums=('ad3fd51cca387cb57af6a1aec93e651f631221193c7928a60f81787bde4f18fc')

package() {
    cd "${pkgname}-${pkgver}"
    gzip -9f "${pkgname}.1"
    install -D -m755 "$pkgname"        "${pkgdir}/usr/bin/${pkgname}"
    install -D -m644 "${pkgname}.1.gz" "${pkgdir}/usr/share/man/man1/${pkgname}.1.gz"
}
