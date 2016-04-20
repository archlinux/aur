# Maintainer: eolianoe <eolianoe [at] gmail [DoT] com>
# Contributor: Daniel Nagy <danielnagy at gmx de>
# Contributor: grimsock <lord.grimsock at gmail dot com>
# Contributor: Alucryd <alucryd at gmail dot com>

_pkgname=testng
pkgname=java-${_pkgname}
pkgver=6.9.11
pkgrel=1
pkgdesc='A testing framework inspired from JUnit and NUnit'
arch=('any')
url='http://testng.org/doc/index.html'
license=('APACHE')
depends=("java-runtime")
makedepends=("maven" "java-environment")
source=("${_pkgname}-${pkgver}.tar.gz::https://github.com/cbeust/testng/archive/${pkgver}.tar.gz")
sha256sums=('e10c49a31a8d95a3786cf2235c4d033c3719592e4c86242f325131d50e5f7f0b')

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  mvn package
}

package() {
  install -Dm644 "${srcdir}/${_pkgname}-$pkgver/target/${_pkgname}-${pkgver}-SNAPSHOT.jar" \
    "${pkgdir}/usr/share/java/${_pkgname}/${_pkgname}-${pkgver}.jar"
}
