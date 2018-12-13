# Contributor: twa022 <twa022 at gmail dot com>

pkgname=violetumleditor
pkgver=3.0.0
pkgrel=1
pkgdesc="Java UML diagram editor"
arch=('any')
url="http://sourceforge.net/projects/violet"
license=('GPL')
depends=('java-runtime')
source=( ${pkgname}-${pkgver}.deb::https://sourceforge.net/projects/violet/files/${pkgname}/${pkgver}/${pkgname}-${pkgver}.deb/download )
sha256sums=('93fd9616d1b870c45bd91f88132239888a521b55daa656a7cdf26532cd2995b8')

package() {
  cd ${srcdir}
  bsdtar -x -f data.tar.gz -C ${pkgdir}
  mkdir -p ${pkgdir}/usr/bin/
  chmod a+x ${pkgdir}/usr/share/${pkgname}/${pkgname}.sh
  ln -s /usr/share/${pkgname}/${pkgname}.sh ${pkgdir}/usr/bin/${pkgname}
}
