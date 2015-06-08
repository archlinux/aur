# Maintainer: Lukas Fleischer <archlinux at crpyotcrack dot de>
# Contributor: Stefan Husmann <stefan-husmann@t-online.de>
# Contributor: Simon Lipp <sloonz+aur@gmail.com>

pkgname=java-batik1.7
_pkgname=java-batik
pkgver=1.7
pkgrel=1
pkgdesc='SVG library for Java.'
arch=('any')
url='http://xmlgraphics.apache.org/batik/'
license=(APACHE)
depends=('java-runtime' 'java-commons-io' 'java-commons-logging' 'java-xmlgraphics-commons')
makedepends=('java-environment' 'apache-ant' 'unzip')
source=("https://www.apache.org/dist/xmlgraphics/batik/source/batik-src-${pkgver}.zip")
md5sums=('c117ca2241907f62a2b3031167ebf917')
provides=("java-batik=${pkgver}")
conflicts=('java-batik')


build() {
  cd "${srcdir}/batik-${pkgver}"
  ant all-jar
}

package() {
  install -d "${pkgdir}/usr/share/java/batik"

  install -m644 "${srcdir}/batik-${pkgver}/batik-${pkgver}/lib/batik-all.jar" \
    "${pkgdir}/usr/share/java/batik/"
  cp -r "${srcdir}/batik-${pkgver}/lib"/*.jar "${pkgdir}/usr/share/java/batik/"
}
