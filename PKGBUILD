# Maintainer: kaptoxic@yahoo.com
# Maintainer:  Marcin (CTRL) Wieczorek <marcin@marcin.co>
# Contributor: Jaime Gil de Sagredo <jaimegildesagredo@gmail.com>

pkgname='checkstyle'
pkgver='8.5'
pkgrel=1
pkgdesc='A tool to help programmers write Java code that adheres to a coding standard'
arch=('any')
license=('LGPL2.1')
depends=('java-runtime>=8')
#makedepends=('maven' 'java-environment>=8')
url='http://checkstyle.sourceforge.net'
source=(
  "https://sourceforge.net/projects/checkstyle/files/checkstyle/${pkgver}/${pkgname}-${pkgver}-bin.tar.gz/download"
  'checkstyle')
md5sums=('5ace016b0fd22b6cd86b06119f648815'
         'eb71b85acb81e0d3c5f0809fe93641dc')

package() {
  cd "${srcdir}/${pkgname}-${pkgver}/"
  mkdir -p "${pkgdir}/usr/share/java/${pkgname}/"
  mkdir -p "${pkgdir}/usr/bin/"
  install -D -m755 "${srcdir}/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
  install -D -m644 "${srcdir}/${pkgname}-${pkgver}/${pkgname}-${pkgver}-all.jar" "${pkgdir}/usr/share/java/${pkgname}/${pkgname}.jar"
  install -D -m644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
