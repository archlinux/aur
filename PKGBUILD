# Maintainer: GordonGR <ntheo1979@gmail.com>
# Contributor: George Rawlinson <george@rawlinson.net.nz>
# Contributor: Elena ``of Valhalla'' Grandi <elena.valhalla@gmail.com>
# Contributor: Huulivoide <jesse.jaara@gmail.com>

pkgname=otf-textfonts
pkgver=13.00
pkgrel=1
pkgdesc="Text faces based on early Greek editions"
arch=('any')
url="https://dn-works.com/ufas/"
license=('custom')
depends=('fontconfig' 'xorg-font-utils')
conflicts=('ttf-alexander' 'ttf-alfios' 'ttf-anaktoria' 'ttf-aroania' 'ttf-atavyros' 'ttf-avdira' 'ttf-asea' 'ttf-textfonts')
replaces=('ttf-textfonts')
source=("${pkgname}-${pkgver}.zip::https://dn-works.com/wp-content/uploads/2020/UFAS-Fonts/Textfonts.zip"
	 "LICENSE")
md5sums=('bac05e4ebd52928c5fde6f3d523c4680'
         '10ed660cf88e58fe902e655d966260b3')

package()
{
install -d "$pkgdir/usr/share/fonts/${pkgname}"

for file in "${srcdir}"/*otf; do
  install -m 644 -D "${file}" "${pkgdir}/usr/share/fonts/${pkgname}/"
done

for file in "${srcdir}"/hinted/*otf; do
  install -m 644 -D "${file}" "${pkgdir}/usr/share/fonts/${pkgname}/"
done

install -m 644 -D $srcdir/LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
}
