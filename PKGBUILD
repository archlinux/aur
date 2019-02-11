# Maintainer:  Marcin (CTRL) Wieczorek <marcin@marcin.co>
# Contributor: Xiao-Long Chen <chenxiaolong@cxl.epac.to>

pkgname=java-commons-collections
pkgver=4.3
pkgrel=1
pkgdesc='Implementations of common collections'
arch=('any')
url='http://commons.apache.org/collections/'
license=('APACHE')
depends=(java-runtime)
makedepends=(maven)
source=("http://www.apache.org/dist/commons/collections/source/commons-collections4-${pkgver}-src.tar.gz")
sha512sums=('424171ac178ad2f5d7c2d9cc6bd00ad091e50a82a24da998b6c45d0a91d6c847553298480d10d3c177ebfcfbad23d139a9ba5cd182ae021ae463955b9314d4c4')

build() {
  cd "${srcdir}/commons-collections4-${pkgver}-src"

  mvn package
}

package() {
  cd "${srcdir}/commons-collections4-${pkgver}-src/"

  install -dm755 "${pkgdir}/usr/share/java/commons-collections/"
  install -D -m644 "LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt"
  install -m644 "target/commons-collections4-${pkgver}.jar" "${pkgdir}/usr/share/java/commons-collections/commons-collections4.jar"
}
