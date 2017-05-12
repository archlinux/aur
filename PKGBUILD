# Maintainer: bohoomil <@zoho.com>

pkgname=ttf-signika-family-ib
pkgver=1.0001
pkgrel=8
depends=('fontconfig')
pkgdesc="Signika is a sans-serif with a gentle character, developed for wayfinding, signage, and other media where clarity of information is required. TrueType version."
groups=('infinality-bundle-fonts-extra')
conflicts=('ttf-google-webfonts-git' 'otf-signika-family-ib')
replaces=('otf-signika-family-ib' 'ttf-signika-family-ibx')
url="http://fontfabric.com/signika-font/"
arch=('any')
license=('custom:OFL')
#http://www.google.com/fonts
source=(http://dl.1001fonts.com/signika.zip
        45-signika.conf
        90-tt-signika.conf)
sha1sums=('f56c70f97924ffef70b793ccc94df015d231b7b0'
          '16aff1bcdddfaa1c64ecc56c3d370953dffe8e46'
          '107bcfd30759580b9dd213c329dc735f26f87fc3')

package(){
  cd $srcdir
  install -D -m644 Signika/OFL.txt "${pkgdir}"/usr/share/licenses/"${pkgname}"/COPYING

  install -m755 -d "${pkgdir}"/usr/share/fonts/"${pkgname}"
  install -m644 */*.ttf "${pkgdir}"/usr/share/fonts/"${pkgname}"

  install -D -m644 45-signika.conf \
    "${pkgdir}"/etc/fonts/conf.avail/45-signika.conf
  install -D -m644 90-tt-signika.conf \
    "${pkgdir}"/etc/fonts/conf.avail/90-tt-signika.conf

  install -m755 -d "${pkgdir}"/etc/fonts/conf.d
  cd "${pkgdir}"/etc/fonts/conf.d
  ln -s ../conf.avail/45-signika.conf .
  ln -s ../conf.avail/90-tt-signika.conf .
}
