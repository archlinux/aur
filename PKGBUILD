# Maintainer: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=aurora-timetable
pkgver=0.13.0
pkgrel=1
pkgdesc="A timetable generator and editor application, mainly for elementary and high schools"
arch=('any')
url='https://timetable-software.com'
provides=('aurora-orarend')
license=('Apache')
depends=('java-runtime>=8'
         'bash'
         'hicolor-icon-theme')
makedepends=('tar')
source=("${pkgname}-${pkgver}.deb::https://timetable-software.com/download/aurora-orarend_${pkgver}-1.deb")
sha256sums=('3af580c59dda8699d26ad06a9237898614967fd7f63558a7305a5d2cadee1dd7')

package() {
  tar xvf data.tar.gz -C "${pkgdir}/"
  install -d "${pkgdir}/usr/share/java"
  mv "${pkgdir}/usr/share/aurora-orarend" "${pkgdir}/usr/share/java/"
  sed -i "3s|aurora-orarend|java/aurora-orarend|" "${pkgdir}/usr/bin/aurora-orarend"
}