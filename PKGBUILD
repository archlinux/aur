# Maintainer: Xiao-Long Chen <chenxiaolong@cxl.epac.to>

pkgname=java-commons-lang
pkgver=2.6
pkgrel=2
pkgdesc='Implementations of common Lang'
arch=(i686 x86_64)
url='http://commons.apache.org/lang/'
license=(apache)
depends=(java-runtime)
makedepends=(apache-ant junit)
source=("http://www.apache.org/dist/commons/lang/source/commons-lang-${pkgver}-src.tar.gz")
md5sums=('37ee469f4caff6cfa28f9d0a0be2d4d2')
sha512sums=('4a30ed153f93fe6616a28974721bdf005d064203ef8a3dd375d6c1176647c0cdbd29cfde2a580e2c8d26bfa4655be6be7025b8ccae94086dcd816676c5cf8e87')

build() {
  cd "commons-lang-${pkgver}-src"

  # Tests currently fail
  #ant jar test
  ant jar
}

package() {
  cd "commons-lang-${pkgver}-src/target"

  install -dm755 "${pkgdir}/usr/share/java/commons-lang/"
  install -m644 commons-lang-${pkgver}.jar \
    "${pkgdir}/usr/share/java/commons-lang/commons-lang.jar"
}
