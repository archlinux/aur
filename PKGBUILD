# Contributor: Elena ``of Valhalla'' Grandi <elena.valhalla@gmail.com>
# Contributor: Huulivoide <jesse.jaara@gmail.com>
# Maintainer: GordonGR <ntheo1979@gmail.com>

pkgname=ttf-textfonts
pkgver=6.00
pkgrel=1
pkgdesc="Fonts based on early works by Alexander Wilson, Claude Garamond, Victor Scholderer, Firmin Didot et al."
arch=('any')
url="http://users.teilar.gr/~g1951d/"
license=('custom')
depends=('fontconfig' 'xorg-font-utils')
conflicts=('ttf-alexander' 'ttf-alfios' 'ttf-anaktoria' 'ttf-aroania' 'ttf-atavyros' 'ttf-avdira' 'ttf-asea')
replaces=('ttf-alexander' 'ttf-alfios' 'ttf-anaktoria' 'ttf-aroania' 'ttf-atavyros' 'ttf-avdira' 'ttf-asea')
source=("http://users.teilar.gr/~g1951d/TextFonts.zip" "LICENSE")
install=$pkgname.install
md5sums=('21459dd5a047efe1ae6b81041ed2e276'
         'bc1709dc3b1f6a7545ab366923e01a1c')

package()
{
for file in "${srcdir}"/*ttf; do
  install -m 644 -D "${file}" "${pkgdir}/usr/share/fonts/TTF"/$(basename $file)
done

install -m 644 -D $srcdir/LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
}
