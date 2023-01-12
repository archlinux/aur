# Maintainer: Frederik Schwan <freswa at archlinux dot org>
# Contributor: Sebastian Bøe <sebastianbooe at gmail dot com>

pkgname=chisel
pkgver=3.5.6
pkgrel=1
pkgdesc='Constructing Hardware in a Scala Embedded Language'
arch=('any')
url='https://chisel.eecs.berkeley.edu/'
license=('BSD')
depends=('java-environment=11' 'verilator')
makedepends=('sbt' 'graphviz')
source=("https://github.com/freechipsproject/chisel3/archive/v${pkgver}/${pkgname}-${pkgver}.tar.gz")
b2sums=('b2bbb4eeaa6d176583715f3305d0d4df93932ccd6e940164b8647a6fde0e60b7672377fa2239a408c3bf5da1bea28c0e44266282a3d423ee58b839b312c3c793')

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
