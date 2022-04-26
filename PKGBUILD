# Maintainer: Frederik Schwan <freswa at archlinux dot org>
# Contributor: Sebastian Bøe <sebastianbooe at gmail dot com>

pkgname=chisel
pkgver=3.5.3
pkgrel=1
pkgdesc='Constructing Hardware in a Scala Embedded Language'
arch=('any')
url='https://chisel.eecs.berkeley.edu/'
license=('BSD')
depends=('java-environment=11' 'verilator')
makedepends=('sbt' 'graphviz')
source=("https://github.com/freechipsproject/chisel3/archive/v${pkgver}/${pkgname}-${pkgver}.tar.gz")
b2sums=('60dc92d5ade444fd491f69250d0036ece7b5adea3ef4b7a70abab332200b18df320bf9d09a3b430a8f34ab3bcc974818a7e1ef8d9a65793d51fc09ffd18f787e')

build(){
  cd ${pkgname}3-${pkgver}
  sbt publishLocal
}

package() {
  cd ${pkgname}3-${pkgver}
  install -dm755 "${pkgdir}"/usr/share/licenses/${pkgname} "${pkgdir}"/usr/share/scala/${pkgname}/
  install -Dm644 target/scala-2.12/${pkgname}3_2.12-${pkgver}.jar "${pkgdir}"/usr/share/scala/${pkgname}/${pkgname}.jar
  install -Dm644 LICENSE "${pkgdir}"/usr/share/licenses/${pkgname}/
}
