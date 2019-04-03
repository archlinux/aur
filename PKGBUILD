# Maintainer: Eric Bélanger <eric@archlinux.org>

pkgname=ttf-cheapskate
pkgver=2.0
pkgrel=12
pkgdesc="TTFonts collection from dustimo.com"
arch=('any')
url="http://dustismo.com/"
license=('GPL')
depends=('xorg-fonts-encodings' 'xorg-fonts-alias' 'xorg-font-utils' 'fontconfig')
source=(https://sources.archlinux.org/other/packages/ttf-cheapskate/ttf-dustin_20030517.orig.tar.gz)
sha1sums=('66fe8772adf3e3390706c2a34380e380d5533677')

package() {
  cd ttf-dustin-20030517
  for file in *.zip; do
    bsdtar -xf $file
  done
  install -d "${pkgdir}/usr/share/fonts/TTF"
  install -m644 *.ttf "${pkgdir}/usr/share/fonts/TTF/"
}
