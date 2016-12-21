# Maintainer: zoe <chp321 [at] gmail [dot] com>
# Contributor: Hyacinthe Cartiaux <hyacinthe.cartiaux@free.fr>
# Contributor: damian01w <damian01w@gmail.com>

# kf5 version kde-servicemenus-encfs

pkgname=kf5-servicemenus-encfs
pkgver=0.5.2
pkgrel=1
pkgdesc="One KDE servicemenu for encfs encrypted directories ; kf5 version"
arch=('i686' 'x86_64')
url="http://kde-apps.org/content/show.php?content=57086"
license=('GPL3')
depends=('plasma-framework' 'dolphin' 'kdialog' 'encfs')
conflicts=('kde-servicemenus-encfs')
source=("https://dl.opendesktop.org/api/files/download/id/1460731774/57086-kde-service-menu-encfs_${pkgver}.tar.gz")
md5sums=('42b10bd668568ce8ffdd25351c0f2d7e')

build() {
  tar -xvf ${srcdir}/57086-kde-service-menu-encfs_${pkgver}.tar.gz
  cd ${srcdir}/kde-service-menu-encfs_${pkgver}
}

package() {
  # We reproduce the steps from the install script
  prefix=$(kf5-config --prefix)

  mkdir -p ${pkgdir}/usr/bin/
  install -m 755 ${srcdir}/kde-service-menu-encfs_${pkgver}/bin/* ${pkgdir}/usr/bin/

  mkdir -p ${pkgdir}/${prefix}/share/kservices5/ServiceMenus/
  install -m 644 ${srcdir}/kde-service-menu-encfs_${pkgver}/desktop/*.desktop ${pkgdir}/${prefix}/share/kservices5/ServiceMenus/

  mkdir -p ${pkgdir}/${prefix}/share/doc/${pkgname}
  install -m 644 ${srcdir}/kde-service-menu-encfs_${pkgver}/doc/* ${pkgdir}/${prefix}/share/doc/${pkgname}
}
