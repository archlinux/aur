# Maintainer: jyantis <yantis@yantis.net>

# Improvements & Fixes added from suggestions of Tristelune

pkgname=dvdae-bin
pkgver=7.2.0
pkgrel=1
pkgdesc='DVD audio extract & ripping tool for extracting streams from DVD-Audio & Video discs and save them as OGG, MP3, Wave or FLAC files.'
url='http://www.dvdae.com'
arch=(x86_64)
source=("http://www.dvdae.com/dvdae/dvdae_7.2.0_amd64.deb" "http://www.dvdae.com/license.htm")
license=('custom')
depends=( 'flac'
         'gtk2'
         'lame>=3.99.1'
         'libvorbis'
         'libgcrypt15'
         'libsm'
         'alsa-lib')
md5sums=('5a185707288127aed60ef003ffae43ec'
         'e971696dc612a5bb7fdb8eac0241fc90')

build() {
        cd "$srcdir"
        bsdtar xvf data.tar.gz
}

package() {
    cd "$srcdir"
    install -D -m644 license.htm "${pkgdir}/usr/share/licenses/${pkgname}/license.htm"
    cp -r usr $pkgdir
}
