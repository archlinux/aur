# Maintainer: John Lane <archlinux at jelmail dot com>
#
# An open source version of Edward Johnston's Timeless Typeface for London Underground of 1916

pkgname=railway-sans-font
pkgver=20131215
pkgrel=1
pkgdesc="An open source version of Edward Johnston's Timeless Typeface for London Underground of 1916"
arch=('any')
url='http://openfontlibrary.org/en/font/railway-sans'
license=('OFL:SIL Open Font License http://opensource.org/licenses/OFL-1.1')
install='install'

source=('http://openfontlibrary.org/assets/downloads/railway-sans/e20a3eb56cd480c597e654f035e3754e/railway-sans.zip')

md5sums=('e20a3eb56cd480c597e654f035e3754e')

package() {
  install -dm755 $pkgdir/usr/share/fonts/{O,T}TF
  find "$srcdir" -name "*.otf" -exec install {} $pkgdir/usr/share/fonts/OTF \;
  find "$srcdir" -name "*.ttf" -exec install {} $pkgdir/usr/share/fonts/TTF \;

  install -d ${pkgdir}/usr/share/licenses/"${pkgname}"
  install "$srcdir"/RailwaySans/LICENSE.txt ${pkgdir}/usr/share/licenses/"${pkgname}"/LICENCE

  install -d ${pkgdir}/usr/share/doc/"${pkgname}"
  install "$srcdir"/RailwaySans/docs/* ${pkgdir}/usr/share/doc/"${pkgname}"
}
