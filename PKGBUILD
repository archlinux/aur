# Contributor: twa022 <twa022 at gmail dot com>

pkgname=violetumleditor
epoch=1
_pkgver=2.2.2
_snapshot=20250531
pkgver=${_pkgver}_${_snapshot}
pkgrel=1
pkgdesc="Java UML diagram editor"
arch=('any')
url="http://sourceforge.net/projects/violet"
license=('GPL')
depends=('java-runtime')
source=("${pkgname}-${pkgver}.deb::https://sourceforge.net/projects/violet/files/violetumleditor/${_pkgver}-SNAPSHOT/${pkgname}-${_pkgver}-SNAPSHOT.deb/download")
sha256sums=('3920a780a48bcb8f594b29e9cffa19b867cc900d0569f43c7a1b2860c1b743a1')

package() {
  cd ${srcdir}
  bsdtar -x -f data.tar.gz -C ${pkgdir}
  mkdir -p ${pkgdir}/usr/bin/
  chmod a+x ${pkgdir}/usr/share/${pkgname}/${pkgname}.sh
  ln -s /usr/share/${pkgname}/${pkgname}.sh ${pkgdir}/usr/bin/${pkgname}
}
