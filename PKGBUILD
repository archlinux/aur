# Maintainer: MadPhysicist <jfoxrabinovitz at gmail dot com>
# Contributor: Daniel Nagy <danielnagy at gmx de>
# Contributor: grimsock <lord.grimsock at gmail dot com>

_pkgname=testng
pkgname=java-${_pkgname}-doc
pkgver=6.9.11
pkgrel=2
pkgdesc='Documentation for TestNG'
arch=('any')
url='http://testng.org/doc/index.html'
license=('APACHE')
makedepends=("maven" "java-environment")
source=("https://github.com/cbeust/testng/archive/${pkgver}.zip")
sha1sums=('d3e0677587f173b232321c0e165d8cd0fa57a573')

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
