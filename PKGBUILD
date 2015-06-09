# Maintainer: Xiao-Long Chen <chenxiaolong@cxl.epac.to>

pkgname=java-commons-collections
pkgver=4.0
pkgrel=1
pkgdesc='Implementations of common collections'
arch=(i686 x86_64)
url='http://commons.apache.org/collections/'
license=(apache)
depends=(java-runtime)
makedepends=(apache-ant junit)
source=("http://www.apache.org/dist/commons/collections/source/commons-collections4-${pkgver}-src.tar.gz")
md5sums=('d0f1e679725945eaf3e2f0c0a33532a5')
sha512sums=('3e9ea6325878a288f5127e6135155436d26b862235d57aaf6ca2dcda6e72b12a9fce3e207a48f9f1bb1781237a026843dc1d0116b1a0c5859581d41868725ac6')

build() {
  cd "commons-collections4-${pkgver}-src"

  ant jar
}

package() {
  cd "commons-collections4-${pkgver}-src/target/"

  install -dm755 "${pkgdir}/usr/share/java/commons-collections/"
  install -m644 commons-collections4-${pkgver}-SNAPSHOT.jar \
    "${pkgdir}/usr/share/java/commons-collections/commons-collections4.jar"
}
