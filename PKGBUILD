# Maintainer: Frederik Schwan <frederik dot schwan at linux dot com>
# Contributor: Sebastian Bøe <sebastianbooe at gmail dot com>

pkgname=chisel
pkgver=3.2.2
pkgrel=1
pkgdesc='Constructing Hardware in a Scala Embedded Language'
arch=('any')
url='https://chisel.eecs.berkeley.edu/'
license=('BSD')
depends=('java-environment' 'verilator')
makedepends=('sbt' 'graphviz')
source=("https://github.com/freechipsproject/chisel3/archive/v$pkgver.tar.gz")
sha512sums=('309271717639854b010c5bc96a8a8d665ace630ba323cc38a9ff5ab70453fd6c1f2f558a58b3a0349f281b365fe355ad4cf1ddb428d3424e6e230ad0fc3311bf')

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
