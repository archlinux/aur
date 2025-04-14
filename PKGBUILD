# Maintainer: ava1ar <mail@ava1ar.me>

pkgname=aftershotpro3
pkgver=3.7.0.446
pkgrel=2
pkgdesc="Professional Workflow and RAW Conversion (3rd version)"
url="http://www.aftershotpro.com/en/products/aftershot/pro"
arch=('x86_64')
license=('custom')
depends=('gstreamer0.10-base' 'ocl-icd')
optdepends=('opencl-nvidia' 'opencl-clover-mesa' 'opencl-amd')
source=(AfterShotPro_${pkgver}.rpm::http://dwnld.aftershotpro.com/trials/3/AfterShotPro3.rpm license.txt)
sha1sums=('772b1db13ac93cf9c164b82394de3df10add4cf5'
          '564fa56309798c82852e25f204f75834ebcf08fd')

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
