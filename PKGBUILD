# Maintainer:  Marcin (CTRL) Wieczorek <marcin@marcin.co>
# Contributor: Xiao-Long Chen <chenxiaolong@cxl.epac.to>

pkgname=java-commons-collections
pkgver=4.1
pkgrel=1
pkgdesc='Implementations of common collections'
arch=('any')
url='http://commons.apache.org/collections/'
license=('APACHE')
depends=(java-runtime)
makedepends=(apache-ant junit)
source=("http://www.apache.org/dist/commons/collections/source/commons-collections4-${pkgver}-src.tar.gz")
sha512sums=('c5666f41b68c9fdba3731730595616b16f98579c077cf047f421a46729b5a65476a8707125a2c0b0c6c024ca94df8c2633123bd99e705149fcb1afadcd3bf68b')

build() {
  cd "${srcdir}/commons-collections4-${pkgver}-src"

  ant jar
}

package() {
  cd "${srcdir}/commons-collections4-${pkgver}-src/"

  install -dm755 "${pkgdir}/usr/share/java/commons-collections/"
  install -D -m644 "LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt"
  install -m644 "target/commons-collections4-${pkgver}.jar" "${pkgdir}/usr/share/java/commons-collections/commons-collections4.jar"
}
