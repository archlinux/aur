# Maintainer:  bartekww

pkgname=samsung_magician
pkgver=v1.0_rtm_p2
pkgrel=2
pkgdesc="Utility for Samsung SSDs. User guide: http://www.samsung.com/global/business/semiconductor/minisite/SSD/downloads/software/Samsung_Magician_DC_v10_User_Guide.pdf"
url="http://www.samsung.com/"
arch=('x86_64' 'i686')
license=('custom')
depends=('jsoncpp' 'hdparm')
source=("http://www.samsung.com/global/business/semiconductor/minisite/SSD/downloads/software/samsung_magician_dc-${pkgver}.tar.gz" "LICENSE")
md5sums=('b7e88ecac15adddaa5bfae3f679ee2ca' '138596cfbe00f6b9ead1829b300f5e83')

package() {
	
  if [[ $CARCH = i686 ]]; then
	cd ${srcdir}/samsung_magician_dc-${pkgver}/32bin/
  fi

  if [[ $CARCH = x86_64 ]]; then
	cd ${srcdir}/samsung_magician_dc-${pkgver}/64bin/
  fi

  install -Dm 755 magician ${pkgdir}/usr/bin/magician 
  install -D -m644 ${srcdir}/LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
