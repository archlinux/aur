# Maintainer: zoe <chp321 [at] gmail [dot] com>
# Contributor: Hyacinthe Cartiaux <hyacinthe.cartiaux@free.fr>
# Contributor: damian01w <damian01w@gmail.com>
# Contributor: giuseppe.benigno(at)gmail.com

# kf5 version kde-servicemenus-encfs

pkgname=kf5-servicemenus-encfs
pkgver=0.5.2
pkgrel=2
pkgdesc="One KDE servicemenu for encfs encrypted directories ; kf5 version"
arch=('i686' 'x86_64')
url="http://www.egregorion.net/"
license=('GPL3')
depends=('plasma-framework' 'dolphin' 'kdialog' 'encfs')
conflicts=('kde-servicemenus-encfs')
source=("${pkgname}.tar.gz")
md5sums=('9e738c198b81df4ac8a7e4e6cb3514dd')

build() {
  cd ${srcdir}/kf5-servicemenus-encfs
}

package() {
  prefix=$(qtpaths --install-prefix)

  mkdir -p ${pkgdir}/usr/bin/
  install -D -m755 ${srcdir}/kf5-servicemenus-encfs/bin/encfs_kmenu.sh ${pkgdir}/usr/bin/

  mkdir -p ${pkgdir}/${prefix}/share/kservices5/ServiceMenus/
  install -D -m644 ${srcdir}/kf5-servicemenus-encfs/desktop/encfs.desktop ${pkgdir}/${prefix}/share/kservices5/ServiceMenus/

  mkdir -p ${pkgdir}/${prefix}/share/doc/${pkgname}
  install -D -m644 ${srcdir}/kf5-servicemenus-encfs/doc/* ${pkgdir}/${prefix}/share/doc/${pkgname}
}
