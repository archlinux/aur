# Maintainer: MadPhysicist <jfoxrabinovitz at gmail dot com>
# Contributor: Daniel Nagy <danielnagy at gmx de>
# Contributor: grimsock <lord.grimsock at gmail dot com>

_pkgname=testng
pkgname=java-${_pkgname}-doc
pkgver=6.10
pkgrel=1
pkgdesc='Documentation for TestNG, including JavaDocs'
arch=('any')
url='http://testng.org/doc/index.html'
license=('APACHE')
optdepends=('java-testng')
source=("https://github.com/cbeust/testng/archive/${pkgver}.zip"
        "https://dl.bintray.com/cbeust/maven/org/${_pkgname}/${_pkgname}/${pkgver}/${_pkgname}-${pkgver}-javadoc.jar")
sha1sums=('08d37655902c91c0978c8d366a7787017dbff9b4'
          '588006162d6ca512869533e1d6cf20d60ed7f30c')
noextract=("${source[@]##*/}")

prepare() {
  unzip "${srcdir}/${pkgver}.zip" "${_pkgname}-${pkgver}/docs/*" -d "${srcdir}"
}

package() {
  install -dm755 ${pkgdir}/usr/share/doc/${_pkgname}
  cp -r "${srcdir}/${_pkgname}-${pkgver}/docs" "${pkgdir}/usr/share/doc/${_pkgname}"
  cp "${srcdir}/${_pkgname}-${pkgver}-javadoc.jar" "${pkgdir}/usr/share/doc/${_pkgname}/${_pkgname}-javadoc.jar"
}

