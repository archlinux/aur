# Maintainer: zoe <chp321 [at] gmail [dot] com>
# Contributor: Hyacinthe Cartiaux <hyacinthe.cartiaux@free.fr>
# Contributor: damian01w <damian01w@gmail.com>
# Contributor: giuseppe.benigno(at)gmail.com

# kf5 version kde-servicemenus-encfs

pkgname=kf5-servicemenus-encfs
pkgver=0.5.2
pkgrel=3
pkgdesc="One KDE servicemenu for encfs encrypted directories ; kf5 version"
arch=('i686' 'x86_64')
url="http://www.egregorion.net/"
license=('GPL3')
depends=('plasma-workspace' 'dolphin' 'kdialog' 'encfs')
conflicts=('kde-servicemenus-encfs')
source=("${pkgname}-${pkgver}.tar.gz")
md5sums=('64a7c438b08e0622e271c54cfde733d4')

package() {
  prefix=$(qtpaths --install-prefix)

  mkdir -p ${pkgdir}/usr/bin/
  install -D -m755 ${srcdir}/${pkgname}-${pkgver}/bin/encfs_kmenu.sh ${pkgdir}/usr/bin/

  mkdir -p ${pkgdir}/${prefix}/share/kservices5/ServiceMenus/
  install -D -m644 ${srcdir}/${pkgname}-${pkgver}/desktop/encfs.desktop ${pkgdir}/${prefix}/share/kservices5/ServiceMenus/

  mkdir -p ${pkgdir}/${prefix}/share/doc/${pkgname}
  install -D -m644 ${srcdir}/${pkgname}-${pkgver}/doc/* ${pkgdir}/${prefix}/share/doc/${pkgname}
}
