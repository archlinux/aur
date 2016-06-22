# Maintainer: MadPhysicist <jfoxrabinovitz at gmail dot com>
# Contributor: Daniel Nagy <danielnagy at gmx de>
# Contributor: grimsock <lord.grimsock at gmail dot com>

_pkgname=testng
pkgname=java-${_pkgname}-doc
pkgver=6.9.12
pkgrel=1
pkgdesc='Documentation for TestNG'
arch=('any')
url='http://testng.org/doc/index.html'
license=('APACHE')
makedepends=("maven" "java-environment")
source=("https://github.com/cbeust/testng/archive/${pkgver}.zip")
sha1sums=('e8d6efff6e536d972da79ebba5d2bd4a4cf073c7')

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  mvn javadoc:javadoc
  rm target/site/apidocs/javadoc.sh
  rm target/site/apidocs/options
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  install -dm755 ${pkgdir}/usr/share/doc/${_pkgname}
  cp -r doc "${pkgdir}/usr/share/doc/${_pkgname}"
  cp -r target/site/apidocs "${pkgdir}/usr/share/doc/${_pkgname}/javadocs"
}
