# Maintainer: Xiao-Long Chen <chenxiaolong@cxl.epac.to>

# Based on Fedora 18's packaging

pkgname=velocity
pkgver=2.1
pkgrel=1
pkgdesc="Free open-source templating engine"
arch=(any)
url="http://velocity.apache.org/"
license=(Apache)
depends=('jakarta-oro'
         'java-bcel'
         'java-commons-collections'
         'java-commons-logging'
         'java-commons-lang3'
         'java-jdom'
         'junit'
         'log4j')
makedepends=('antlr2'
	    'apache-ant')
source=("http://mirror.23media.de/apache/$pkgname/engine/$pkgver/$pkgname-engine-core-$pkgver.jar"
	"http://mirror.23media.de/apache/$pkgname/engine/$pkgver/$pkgname-engine-scripting-$pkgver.jar"
	"http://mirror.23media.de/apache/$pkgname/engine/$pkgver/$pkgname-engine-examples-$pkgver.jar")
sha256sums=('a921aa299420462f7c39ebe05cdf22ae5b188b67518a2aae06844732fdcc9d7a'
            '18a66042f885c3ca9174b0d6f60e3c7c25b05e5e90b78576b63f0381b8dbdc11'
            'd48d880e456bdd5d6952ef2db8a80164a1d7ab6a03a66c4b1b3a5102ad91ebb5')

package() {
  install -dm755 "${pkgdir}/usr/share/java/"
  for i in  engine-core engine-scripting engine-examples
  do
    install -m644 ${pkgname}-$i-${pkgver}.jar -t "${pkgdir}/usr/share/java/"
  done
}
