# Maintainer: Gavin Lloyd <gavinhungry@gmail.com>

pkgname=intel-joule-setup-tool
pkgver=2016.4.008
pkgrel=1
pkgdesc='Configuration tool for Intel Joule module'
arch=('x86_64')
url='https://software.intel.com/en-us/node/705675'
license=('custom')
source=("https://downloadmirror.intel.com/26472/eng/Intel_Joule_Setup_Lin_$pkgver.tar.gz"
        "${pkgname}")
sha1sums=('82abb76e05bf9f627088203beb60449cb32e8a50'
          '251a92c7a349398d9cf39c5b42352d9666b99a56')

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
