# Maintainer: kaptoxic@yahoo.com
# Contributor: Jaime Gil de Sagredo <jaimegildesagredo@gmail.com>

_basename=checkstyle
pkgname='checkstyle-bin'
pkgver='8.2'
pkgrel=1
pkgdesc='A tool for helping programmers write Java code that adheres to a coding standard'
arch=('any')
license=('LGPL2.1')
depends=('java-runtime>=8')
#makedepends=('maven' 'java-environment>=8')
conflicts=('checkstyle')
provides=('checkstyle')
url='http://checkstyle.sourceforge.net'
source=(
  "https://sourceforge.net/projects/checkstyle/files/checkstyle/${pkgver}/${_basename}-${pkgver}-bin.tar.gz/download"
  'checkstyle')
md5sums=('1a61a8dd39e8886fe59ec350686a033f'
         '74f9c7a1d6ceaece01a0035158338849')

package() {
  cd "${srcdir}/${_basename}-${pkgver}/"
  mkdir -p "${pkgdir}/usr/share/java/${_basename}/"
  mkdir -p "${pkgdir}/usr/bin/"
  install -D -m755 "${srcdir}/${_basename}" "${pkgdir}/usr/bin/${_basename}"
  install -D -m644 "${srcdir}/${_basename}-${pkgver}/${_basename}-${pkgver}-all.jar" "${pkgdir}/usr/share/java/${_basename}/${_basename}.jar"
  install -D -m644 "LICENSE" "${pkgdir}/usr/share/licenses/${_basename}/LICENSE"
}
