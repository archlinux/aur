# Maintainer: Frederik Schwan <freswa at archlinux dot org>
# Contributor: Sebastian Bøe <sebastianbooe at gmail dot com>

pkgname=chisel
pkgver=3.3.0
pkgrel=1
pkgdesc='Constructing Hardware in a Scala Embedded Language'
arch=('any')
url='https://chisel.eecs.berkeley.edu/'
license=('BSD')
depends=('java-environment' 'verilator')
makedepends=('sbt' 'graphviz')
source=("https://github.com/freechipsproject/chisel3/archive/v${pkgver}/${pkgname}-${pkgver}.tar.gz")
b2sums=('d4d302379e4530ba4ef3ae22eccdb08daa19091304888cc3355aa3b2650a1b70dee8d1711924d7c4a72b2171fe64a67105a10b33cea96f476627bed0b6384b16')

build(){
  cd ${pkgname}3-${pkgver}
  sbt publishLocal
}

package() {
  cd ${pkgname}3-${pkgver}
  install -dm755 "${pkgdir}"/usr/share/licenses/${pkgname} "${pkgdir}"/usr/share/scala/${pkgname}/
  install -Dm644 target/scala-2.12/${pkgname}3_2.12-${pkgver}.jar "${pkgdir}"/usr/share/scala/${pkgname}/${pkgname}.jar
  install -Dm644 src/LICENSE.txt "${pkgdir}"/usr/share/licenses/${pkgname}/
}
