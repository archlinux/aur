# Maintainer: Xiao-Long Chen <chenxiaolong@cxl.epac.to>

pkgname=jakarta-oro
pkgver=2.0.8
pkgrel=1
pkgdesc="Full regular expressions API"
arch=(any)
url="http://jakarta.apache.org/oro"
license=(apache)
makedepends=(apache-ant)
source=("http://archive.apache.org/dist/jakarta/oro/jakarta-oro-${pkgver}.tar.gz")
sha512sums=('a7f6eb6a088765f273df18ccc823f918737f18ec8772275054839a87f8370f1848e795d481f226c712651104d7598ab86c7d90a991fb039df6581f42f1447920')

build() {
  cd "${pkgname}-${pkgver}"

  find . -name '*.jar' -o -name '*.class' -delete

  ant jar
}

package() {
  cd "${pkgname}-${pkgver}"

  install -dm755 "${pkgdir}/usr/share/java/"
  install -m644 ${pkgname}-${pkgver}.jar \
    "${pkgdir}/usr/share/java/${pkgname}.jar"
}
