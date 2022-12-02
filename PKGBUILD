# Maintainer: Guoyi Zhang <guoyi zhang at malacology dot net>
# Contributor: Grey Christoforo <first name at last name dot net>

pkgname=picard-tools
_pkgname=picard
pkgver=2.27.5
pkgrel=4
pkgdesc='set of tools for working with next generation sequencing data in the BAM format'
arch=(x86_64)
url="https://github.com/broadinstitute/picard"
license=(MIT)
depends=('java-runtime=8')
makedepends=('ant' 'git' 'java-environment=8')
source=("git+https://github.com/broadinstitute/picard.git#tag=${pkgver}")
sha256sums=('SKIP')
build(){
  cd $_pkgname
  ./gradlew shadowJar
}
package() {
  install -Dm 755 $srcdir/$_pkgname/build/libs/picard.jar $pkgdir/usr/share/$pkgname/picard.jar
}
