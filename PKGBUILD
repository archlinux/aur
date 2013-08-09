# Maintainer: Hyacinthe Cartiaux <hyacinthe.cartiaux@free.fr>
# Contributor: damian01w <damian01w@gmail.com>

pkgname=kde-servicemenus-encfs
pkgver=0.5.1
pkgrel=2
pkgdesc="One KDE servicemenu for encfs encrypted directories."
arch=('i686' 'x86_64')
url="http://kde-apps.org/content/show.php?content=57086"
license=('GPL3')
depends=('kdebase-workspace' 'encfs')
source=("http://kde-apps.org/CONTENT/content-files/57086-kde-service-menu-encfs_${pkgver}.tar.gz")
md5sums=('ced9b1d14b8f46fa1c53f8a13fe3bc45')

build() {
  tar -xvf ${srcdir}/57086-kde-service-menu-encfs_${pkgver}.tar.gz

  cd ${srcdir}/kde-service-menu-encfs_${pkgver}
}

package() {
  # We reproduce the steps from the install script
  prefix=$(kde4-config --prefix)

  mkdir -p ${pkgdir}/usr/bin/
  install -m 755 ${srcdir}/kde-service-menu-encfs_${pkgver}/bin/* ${pkgdir}/usr/bin/

  mkdir -p ${pkgdir}/${prefix}/share/kde4/services/ServiceMenus/
  install -m 644 ${srcdir}/kde-service-menu-encfs_${pkgver}/desktop/*.desktop ${pkgdir}/${prefix}/share/kde4/services/ServiceMenus/

  mkdir -p ${pkgdir}/${prefix}/share/doc/${pkgname}
  install -m 644 ${srcdir}/kde-service-menu-encfs_${pkgver}/doc/* ${pkgdir}/${prefix}/share/doc/${pkgname}

}

# vim:set ts=2 sw=2 et:
