# Maintainer: Jakob Gahde <j5lx@fmail.co.uk>
# Contributor: Andrejs Mivreņiks <gim at fastmail dot fm>
# Contributor: Vitaliy Berdinskikh ur6lad[at]i.ua

pkgname=sqlite-jdbc
pkgver=3.8.11.2
pkgrel=1
pkgdesc="JDBC driver for SQLite"
arch=('i686' 'x86_64')
url="https://github.com/xerial/sqlite-jdbc"
license=('Apache')
depends=('java-runtime')
makedepends=('java-environment' 'perl' 'maven' 'unzip')
makedepends_x86_64=('lib32-glibc')
source=("https://github.com/xerial/sqlite-jdbc/archive/${pkgver}.tar.gz")
sha256sums=('e1f359d5f2a53dc2b4ee5cfc757b6cad3c85411fe7a09f8e331c3a3f8452be3c')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  export JAVA_HOME=/usr/lib/jvm/default
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}/target"

  install -Dm644 "${pkgname}-${pkgver}.jar" "${pkgdir}/usr/share/java/${pkgname}/${pkgname}-${pkgver}.jar"
  ln -s "${pkgname}-${pkgver}.jar" "${pkgdir}/usr/share/java/${pkgname}/${pkgname}.jar"
}
