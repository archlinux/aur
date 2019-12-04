# Maintainer: Frederik Schwan <frederik dot schwan at linux dot com>
# Contributor: Sebastian Bøe <sebastianbooe at gmail dot com>

pkgname=chisel
pkgver=3.2.1
pkgrel=1
pkgdesc='Constructing Hardware in a Scala Embedded Language'
arch=('any')
url='https://chisel.eecs.berkeley.edu/'
license=('BSD')
depends=('java-environment' 'verilator')
makedepends=('sbt' 'graphviz')
source=("https://github.com/freechipsproject/chisel3/archive/v$pkgver.tar.gz")
sha512sums=('dc69ff71d7001c3ccaeb63a0feed64e1fc70db98c777c73a57d07eb0226b4d7b83a104b58c77bf36bb1c865ebf9b87b0e0122c8e7803e13ea94420a6b51b9d46')

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
