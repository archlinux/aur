# Maintainer: Fabio 'Lolix' Loli <lolix@disroot.org> -> https://github.com/FabioLolix
# Contributor: jyantis <yantis@yantis.net>
# Contributor: Tristelune

pkgname=dvdae-bin
pkgver=8.0.0
pkgrel=1
pkgdesc='DVD audio extract & ripping tool for extracting streams from DVD-Audio & Video discs and save them as OGG, MP3, Wave or FLAC files.'
url='http://www.dvdae.com'
arch=('x86_64')
source=("http://www.dvdae.com/dvdae/dvdae_${pkgver}_amd64.deb"
        "http://www.dvdae.com/license.htm")
license=('custom')
depends=('flac'
         'gtk2'
         'lame'
         'libvorbis'
         'libgcrypt15'
         'libsm'
         'alsa-lib')
md5sums=('4264d57aac63c0b465bead8ba73b6b61'
         'e971696dc612a5bb7fdb8eac0241fc90')

package() {
    cd "$srcdir"
    bsdtar -xf ${srcdir}/data.tar.xz -C ${pkgdir}/
    install -D -m644 license.htm "${pkgdir}/usr/share/licenses/${pkgname}/license.htm"
}
