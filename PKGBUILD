# Maintainer: Daniel Nagy <danielnagy at gmx de>
# Contributor: grimsock <lord.grimsock at gmail dot com>
# Contributor: Alucryd <alucryd at gmail dot com>

_pkgname=testng
pkgname=java-${_pkgname}
pkgver=6.9.4
pkgrel=3
pkgdesc='A testing framework inspired from JUnit and NUnit'
arch=('any')
url='http://testng.org/doc/index.html'
license=('APACHE')
depends=('java-runtime-common')
makedepends=("maven")
source=("https://github.com/cbeust/testng/archive/testng-${pkgver}.zip")
md5sums=('0f9f67d68e9786fd2d6c6c871ffe6241')

build() {
  cd "${srcdir}/${_pkgname}-${_pkgname}-${pkgver}"
  mvn package
}

package() {
  install -Dm644 "${srcdir}/${_pkgname}-${_pkgname}-$pkgver/target/${_pkgname}-${pkgver}.jar" \
    "${pkgdir}/usr/share/java/${_pkgname}/${_pkgname}-${pkgver}.jar"
}
