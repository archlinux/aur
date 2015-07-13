# Contributor: Jakub Bittner, vlastikcz
pkgname=602xmlfiller
pkgver=4.52.0.3_13.0725
pkgrel=1
pkgdesc="Application for filling in and submitting smart forms (ZFO) or work with form applications on desktop PC environment"
url="http://www.602.eu/form-filler"
arch=('i686' 'x86_64')
license=('custom')
depends=('nss')
 
if [[ $CARCH == 'i686' ]]; then
  source=("${pkgname}-${pkgver}.deb::http://www.602.cz/download/602xml/RPM/kub11/Software602_Form_Filler.deb")
  md5sums=('471474ec1fdf2a44ccdfa7c87da1da9a')
elif [[ $CARCH == 'x86_64' ]]; then
  source=("${pkgname}_x64-${pkgver}.deb::http://www.602.cz/download/602xml/RPM/kub11_x64/Software602_Form_Filler.deb")
  md5sums=('a13159d7a74b9dffe436beeccaa0dc2b')
fi
 
 
build() {
	cd "${srcdir}"
	tar -xf data.tar.gz
}
 
package() {
  cd "${srcdir}"
  cp -dr --no-preserve=ownership usr "${pkgdir}"/
}
