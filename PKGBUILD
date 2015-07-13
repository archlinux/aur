#Maintainer: onefire <onefire.myself@gmail.com>
#Contributor: André Fettouhi <A.Fettouhi@gmail.com>
pkgname=eclipse-photran
pkgver=8.1
_pkgver=201308141858
pkgrel=1
pkgdesc="IDE and refactoring toolfor Fortran based on Eclipse and the CDT"
url="http://www.eclipse.org/photran/"
depends=('eclipse>=4.3' 'eclipse-cdt>=8.2.1')
arch=('any')
license=('custom')
_ptprel='7.0.3.201308141907'
source=("http://mirror.cc.columbia.edu/pub/software/eclipse/tools/ptp/updates/kepler/ptp-master-${_ptprel}.zip")
sha512sums=("b986b12191b91e091c237ebd697d5db2cca4b3fae4d15db669c72e41e6638877d6001aff2e00b19d238f967dfdc39f3a41ae104a84c76fe2ef928750297833f0")

package() {
  cd "${srcdir}"
  install -dm 755 "${pkgdir}"/usr/share/eclipse/dropins/photran/eclipse/{plugins,features}
  cp -rvp plugins/org.eclipse.photran.*.jar "${pkgdir}"/usr/share/eclipse/dropins/photran/eclipse/plugins 
  cp -rvp plugins/org.eclipse.rephraserengine.*.jar "${pkgdir}"/usr/share/eclipse/dropins/photran/eclipse/plugins 
  cp features/org.eclipse.photran*"${_pkgver}"*.jar "${pkgdir}"/usr/share/eclipse/dropins/photran/eclipse/features
  cp features/org.eclipse.rephraserengine*"${_pkgver}"*.jar "${pkgdir}"/usr/share/eclipse/dropins/photran/eclipse/features	
}
