# Maintainer: Gavin Lloyd <gavinhungry@gmail.com>

pkgname=intel-joule-setup-tool
pkgver=2016.4.008
pkgrel=2
pkgdesc='Configuration tool for Intel Joule module'
arch=('x86_64')
url='https://software.intel.com/en-us/node/705675'
license=('custom')
source=("https://downloadmirror.intel.com/26472/eng/Intel_Joule_Setup_Lin_$pkgver.tar.gz"
        "${pkgname}")
sha256sums=('4b4da85e1f7cd9d3efd74739926e901f13bb562c19c28cd0c4bf05abd92c95fc'
            '273630070144266f46c5d5342c8b55d26a40ee13c1a4becda06810c140a61a12')

package() {
  cd "${srcdir}/Intel_Joule_Setup_Lin_$pkgver"

  install -d -m755 "${pkgdir}/usr/share/licenses/${pkgname}" "${pkgdir}/opt/intel/joule-setup-tool" "${pkgdir}/usr/bin"
  install -m644 "License/license.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  cp -r pset "${pkgdir}/opt/intel/joule-setup-tool"
  cp -r rpm "${pkgdir}/opt/intel/joule-setup-tool"
  cp -r *.sh "${pkgdir}/opt/intel/joule-setup-tool"

  install -m644 "License/license.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -m755 "${srcdir}/${pkgname}" "${pkgdir}/usr/bin"
}
