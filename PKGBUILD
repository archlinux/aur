# Maintainer: jose <jose1711 [at] gmail (dot) com>

pkgname=beansbinding
arch=('any')
pkgver=1.2.1
pkgrel=1
pkgdesc="Beans Binding API (implementation off JSR295)"
license=('GPL2')
url="https://java.net/projects/beansbinding/"
makedepends=('jdk8-openjdk')
source=("http://deb.debian.org/debian/pool/main/b/${pkgname}/${pkgname}_${pkgver}.orig.tar.gz")
md5sums=('4e71355a3ddbe3ba82cace4554158fca')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  ant jar
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  install -Dm644 dist/beansbinding.jar "${pkgdir}/usr/share/java/beansbinding-${pkgver}.jar"
  ln -sf "/usr/share/java/beansbinding-${pkgver}.jar" "${pkgdir}/usr/share/java/beansbinding.jar"
}
