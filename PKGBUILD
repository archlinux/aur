# Mainainer: bohoomil <@zoho.com>
#Maintainer: Solomon Choina <shlomochoina@gmail.com>
pkgname=ttf-roboto-ibx
pkgver=2.138
pkgrel=1
pkgdesc="Modern sans-serif font family designed by Christian Robertson and introduced with Android Ice Cream Sandwich operating system. Basic, condensed and slab variants included."
arch=('any')
license=('Apache')
url="http://code.google.com/android/"
depends=('fontconfig')
groups=('infinality-bundle-fonts-extra')
provides=('ttf-roboto')
conflicts=('ttf-roboto' 'ttf-roboto-fontconfig' 'ttf-roboto-slab')
# http://www.google.com/fonts
# all scripts
source=(https://sources.archlinux.org/other/community/ttf-roboto/ttf-roboto-hinted-$pkgver.zip
        Roboto_Condensed.zip::https://fonts.google.com/download?family=Roboto%20Condensed
        Roboto_Slab.zip::https://fonts.google.com/download?family=Roboto%20Slab
        45-roboto.conf
        90-tt-roboto.conf)
sha1sums=('e9af9d939703226670a3371c69bb65006203064a'
          '47d39aed2de585d57db015d54c596202b14babc0'
          'be04a62bbeb98aafa2be5d54985d91bafbce055e'
          '8ff0fd3af47b4234cdb40746a29aa613fc8dc502'
          '05cffa42f1ac56bf5595afe2ab67e656555273fb')

package(){
  install -D -m644 "LICENSE.txt" \
    "${pkgdir}"/usr/share/licenses/"${pkgname}"/COPYING

  install -d -m755 "${pkgdir}"/usr/share/fonts/"${pkgname}"
  install -m644 *.ttf "${pkgdir}"/usr/share/fonts/"${pkgname}"

  install -D -m644 45-roboto.conf \
    "${pkgdir}"/etc/fonts/conf.avail/45-roboto.conf
  install -D -m644 90-tt-roboto.conf \
    "${pkgdir}"/etc/fonts/conf.avail/90-tt-roboto.conf

  install -d "${pkgdir}"/etc/fonts/conf.d
  cd "${pkgdir}"/etc/fonts/conf.d
  ln -s ../conf.avail/45-roboto.conf .
  ln -s ../conf.avail/90-tt-roboto.conf .
}
