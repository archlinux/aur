# Maintainer: Daniel Bermond < gmail-com: danielbermond >

pkgname=screencast
pkgver=1.5.0
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
            'optipng: watermark optimization support'
            'oxipng: watermark optimization support'
            'littleutils-full: watermark optimization support'
            'truepng: watermark optimization support'
            'pingo: watermark optimization support'
            'advancecomp: watermark optimization support'
            'bash-completion: bash-completion support')
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/bermond/screencast/archive/v${pkgver}.tar.gz")
sha256sums=('df3e9180c77f733b3e43f9604b630d2d6ced588505cf007a2c344907a3a97a45')

build() {
    cd "${pkgname}-${pkgver}"
    
    make
}

package() {
    cd "${pkgname}-${pkgver}"
    
    make PREFIX='/usr' DESTDIR="$pkgdir" install
}
