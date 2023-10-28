# Maintainer:  Iyán Méndez Veiga <me (at) iyanmv (dot) com>
# Contributor: Hyacinthe Cartiaux <hyacinthe (dot) cartiaux (at) free (dot) fr>
# Contributor: damian01w <damian01w (at) gmail (dot) com>
pkgname=kf5-servicemenus-encfs
_oldpkgname=kde-servicemenus-encfs
_pkgname=kde-service-menu-encfs
pkgver=0.8
pkgrel=3
pkgdesc="One KDE servicemenu for encFS encrypted directories."
arch=(any)
url="https://www.opendesktop.org/p/1231244/"
license=('GPL3')
depends=("plasma-workspace" "encfs")
conflicts=("$_oldpkgname")
replaces=("$_oldpkgname")
source=("https://www.egregorion.net/works/kde/servicemenus/encfs/${_pkgname}-${pkgver}_all.tar.gz")
b2sums=('6dba8d4ed9b1205d27d8adcb4a4f039600d433a127aa01850655ede8c714577c91d0a786eaf46096e74173604899a0070d195cb288a574e43be714f4ef684f07')

package() {
  mkdir -p ${pkgdir}/usr/bin/
  install -m 755 ${srcdir}/${_pkgname}-${pkgver}_all/bin/* ${pkgdir}/usr/bin/

  mkdir -p ${pkgdir}/usr/share/kservices5/ServiceMenus/
  install -m 644 ${srcdir}/${_pkgname}-${pkgver}_all/ServiceMenus/*.desktop ${pkgdir}/usr/share/kservices5/ServiceMenus/

  mkdir -p ${pkgdir}/usr/share/doc/${pkgname}
  install -m 644 ${srcdir}/${_pkgname}-${pkgver}_all/doc/* ${pkgdir}/usr/share/doc/${pkgname}

}
