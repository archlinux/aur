# Maintainer:  zoe <chp321 (at) gmail (dot) com>


pkgname=kde-servicemenus-backupit
_pkgname=kde-service-menu-backupit
pkgver=1.1
pkgrel=1
pkgdesc="Backup and restore files and directories using Dolphin/Konqueror"
arch=('i686' 'x86_64')
url="https://www.egregorion.net/"
license=('GPL3')
depends=('plasma-workspace' 'dolphin>=4' 'konqueror')
source=("https://www.egregorion.net/works/kde/servicemenus/backupit/${_pkgname}_${pkgver}_all.tar.gz")
md5sums=('37e0dd16304e55fbf70937f210eb2231')

build() {
  tar -xvf ${srcdir}/${_pkgname}_${pkgver}_all.tar.gz  
  cd ${srcdir}/${_pkgname}_${pkgver}_all
}

package() {
  mkdir -p ${pkgdir}/usr/bin/
  install -m 755 ${srcdir}/${_pkgname}_${pkgver}_all/bin/* ${pkgdir}/usr/bin/

  mkdir -p ${pkgdir}/usr/share/kservices5/ServiceMenus/
  install -m 644 ${srcdir}/${_pkgname}_${pkgver}_all/ServiceMenus/*.desktop ${pkgdir}/usr/share/kservices5/ServiceMenus/

  mkdir -p ${pkgdir}/usr/share/doc/${pkgname}
  install -m 644 ${srcdir}/${_pkgname}_${pkgver}_all/doc/* ${pkgdir}/usr/share/doc/${pkgname}

}
