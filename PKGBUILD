# Contributor: Elena ``of Valhalla'' Grandi <elena.valhalla@gmail.com>
# Contributor: Huulivoide <jesse.jaara@gmail.com>
# Maintainer: GordonGR <ntheo1979@gmail.com>

pkgname=ttf-textfonts
pkgver=9.00
pkgrel=2
pkgdesc="Text faces based on early Greek editions"
arch=('any')
url="http://users.teilar.gr/~g1951d/"
license=('custom')
depends=('fontconfig' 'xorg-font-utils')
conflicts=('ttf-alexander' 'ttf-alfios' 'ttf-anaktoria' 'ttf-aroania' 'ttf-atavyros' 'ttf-avdira' 'ttf-asea')
source=("http://users.teilar.gr/~g1951d/Textfonts.zip"
	 "LICENSE")
md5sums=('74b0a254be69b818247d31c4c124485f'
         'bc1709dc3b1f6a7545ab366923e01a1c')

package()
{
install -d $pkgdir/usr/share/fonts/TTF/

for file in "${srcdir}"/*ttf; do
  install -m 644 -D "${file}" "${pkgdir}/usr/share/fonts/TTF"/
done

for file in "${srcdir}"/hinted/*ttf; do
  install -m 644 -D "${file}" "${pkgdir}/usr/share/fonts/TTF"/
done

install -m 644 -D $srcdir/LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
}
