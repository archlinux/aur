# Maintainer: Francois Boulogne < fboulogne at april dot org >
pkgname=pdfjumbler
pkgver=0.16
pkgrel=6
pkgdesc="A simple tool to rearrange/merge/delete pages from PDF files"
arch=('i686' 'x86_64')
url="http://sourceforge.net/projects/pdfjumbler/"
license=('AGPL')
depends=(java-runtime)
source=(http://downloads.sourceforge.net/pdfjumbler/${pkgname}-${pkgver}.jar)
md5sums=('a56fefbd6f7b09c9b1e71ef53b87eb9e')

prepare() {
  cd "${srcdir}"

  echo "#!/bin/sh" > "${pkgname}"
  echo "java -jar /usr/share/${pkgname}/${pkgname}-${pkgver}.jar" >> "${pkgname}"
}

package() {
  cd "${srcdir}"
  install -d "${pkgdir}"/usr/{bin,share/"${pkgname}"}
  install "${pkgname}" "${pkgdir}"/usr/bin/"${pkgname}"
  install "${pkgname}"-"${pkgver}".jar  "${pkgdir}"/usr/share/"${pkgname}"
}
