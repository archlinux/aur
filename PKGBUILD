# Maintainer: Fabio Loli <loli_fabio@protonmail.com> -> https://github.com/FabioLolix
# Contributor: jyantis <yantis@yantis.net>
# Contributor: Tristelune

pkgname=dvdae-bin
pkgver=7.5.1
pkgrel=1
pkgdesc='DVD audio extract & ripping tool for extracting streams from DVD-Audio & Video discs and save them as OGG, MP3, Wave or FLAC files.'
url='http://www.dvdae.com'
arch=('x86_64')
source=("http://www.dvdae.com/dvdae/dvdae_${pkgver}_amd64.deb"
        "http://www.dvdae.com/license.htm")
license=('custom')
depends=('flac'
         'gtk2'
         'lame>=3.99.1'
         'libvorbis'
         'libgcrypt15'
         'libsm'
         'alsa-lib')
md5sums=('e1c58d34e0dc047695ed1366e56fa250'
         'e971696dc612a5bb7fdb8eac0241fc90')

package() {
    cd "$srcdir"
    bsdtar -xf ${srcdir}/data.tar.xz -C ${pkgdir}/
    install -D -m644 license.htm "${pkgdir}/usr/share/licenses/${pkgname}/license.htm"
}
