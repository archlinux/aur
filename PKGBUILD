# Maintainer: Bogdan Szczurek <thebodzio@gmail.com>

pkgname=color-icc-srgb
_colordir=usr/share/color/icc
pkgver=20150823
pkgrel=1
pkgdesc="ICC's sRGB profiles"
arch=('any')
url='http://www.color.org/srgbprofiles.xalter'
license=('custom')
source=('http://www.color.org/sRGB_v4_ICC_preference.icc'
        'http://www.color.org/sRGB_v4_ICC_preference_displayclass.icc'
        'http://www.color.org/sRGB_IEC61966-2-1_black_scaled.icc')
md5sums=('a3fe13b83e7cb992f9ecc60c21ed9722'
         'b11a602ca66a0b746b894c4a8301e216'
         '4b699a4c3a7d97acf0a356aed883fd85')

package() {
  cd "$srcdir"

  install -d -m755 $pkgdir/$_colordir
  for profile in *; do
    install -m644 "$profile" $pkgdir/$_colordir
  done
}

# vim:set ts=4 sw=4 et:
