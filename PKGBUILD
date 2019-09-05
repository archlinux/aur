# Maintainer:  Marcin (CTRL) Wieczorek <marcin@marcin.co>
# Contributor: Xiao-Long Chen <chenxiaolong@cxl.epac.to>

pkgname=java-commons-collections
pkgver=4.4
pkgrel=1
pkgdesc='Implementations of common collections'
arch=('any')
url='http://commons.apache.org/collections/'
license=('APACHE')
depends=(java-runtime)
makedepends=(maven)
source=("http://www.apache.org/dist/commons/collections/source/commons-collections4-${pkgver}-src.tar.gz")
sha512sums=('2110e73eda97ca52a886cb708f21d8609a83655861594f3b6eb7a15b777d42eeeefc5d3b28ffc6ecc5e4f0b3fd5407f80019c2ce006f970f55455ef33eee47ee')

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
