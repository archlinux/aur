# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Contributor: jyantis <yantis@yantis.net>
# Contributor: Tristelune

pkgname=dvdae-bin
pkgver=8.1.2
pkgrel=1
pkgdesc="DVD audio extract & ripping tool for extracting streams from DVD-Audio & Video discs and save them as OGG, MP3, Wave or FLAC files"
url="http://www.dvdae.com"
arch=(x86_64)
source=("https://www.dvdae.com/dvdae/dvdae_${pkgver}_amd64.deb"
        "https://www.dvdae.com/license.htm")
license=('custom')
depends=(flac gtk2 lame libvorbis libgcrypt15 libsm alsa-lib)
sha256sums=('942a35c45830acd4ba0c0a0cff9c929f25111a67d8ae643b637a5b773daee0e3'
            '6d780e47d8c961a64fb12815872f2bf622018ff0623a9dd82abe59790cee0550')

package() {
  cd "$srcdir"
  bsdtar -xf ${srcdir}/data.tar.xz -C ${pkgdir}/
  install -D -m644 license.htm "${pkgdir}/usr/share/licenses/${pkgname}/license.htm"
}
