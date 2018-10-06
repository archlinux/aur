# Maintainer: ava1ar <mail@ava1ar.me>

pkgname=aftershotpro3
pkgver=3.5.0.350
pkgrel=1
pkgdesc="Professional Workflow and RAW Conversion (3rd version)"
url="http://www.aftershotpro.com/en/products/aftershot/pro"
arch=('x86_64')
license=('custom')
depends=('gstreamer0.10-base' 'ocl-icd')
optdepends=('opencl-nvidia' 'opencl-mesa' 'opencl-catalyst')
source=(AfterShotPro_${pkgver}.rpm::http://dwnld.aftershotpro.com/trials/3/AfterShotPro3.rpm license.txt)
sha1sums=('7f731ec45ecd6cff64626e72ec88ab037007d1ec'
          'f4b747625da3ad5d09536eb6e68107817826ec7b')

package() {
	# coping rpm content
	mv ${srcdir}/opt ${pkgdir}/
	install -d ${pkgdir}/usr/share
	mv ${srcdir}/usr/bin ${pkgdir}/usr/
	mv ${srcdir}/usr/share/{applications,pixmaps} ${pkgdir}/usr/share/
	install -d ${pkgdir}/usr/share/mime/packages/
	mv ${srcdir}/usr/share/mime/packages/* ${pkgdir}/usr/share/mime/packages/

	# install license
	install -Dm644 license.txt ${pkgdir}/usr/share/licenses/${pkgname}/license.txt
}
