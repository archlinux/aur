# Maintainer: John Lane <archlinux at jelmail dot com>
#
# An open source version of Edward Johnston's Timeless Typeface for London Underground of 1916

pkgname=railway-sans-font-git
pkgver=r36.a374f2a
pkgrel=1
pkgdesc="An open source version of Edward Johnston's Timeless Typeface for London Underground of 1916"
arch=('any')
url='https://github.com/GregFleming/Railway-Sans'
license=('OFL:SIL Open Font License http://opensource.org/licenses/OFL-1.1')
install='install'
provides=('railway-sans-font')
conflicts=('railway-sans-font')

source=('git+https://github.com/GregFleming/Railway-Sans.git')

md5sums=('SKIP')

package() {
  install -dm755 $pkgdir/usr/share/fonts/{O,T}TF
  find "$srcdir" -name "*.otf" -exec install {} $pkgdir/usr/share/fonts/OTF \;
  find "$srcdir" -name "*.ttf" -exec install {} $pkgdir/usr/share/fonts/TTF \;

  install -d ${pkgdir}/usr/share/licenses/"${pkgname}"
  install "$srcdir"/Railway-Sans/LICENSE.txt ${pkgdir}/usr/share/licenses/"${pkgname}"/LICENCE

  install -d ${pkgdir}/usr/share/doc/"${pkgname}"
  install "$srcdir"/Railway-Sans/docs/* ${pkgdir}/usr/share/doc/"${pkgname}"
}

pkgver() {
  cd "$srcdir/Railway-Sans"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}
