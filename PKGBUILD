# Maintainer: Marco Kundt <mrckndt@gmail.com>

pkgname=edsim51
pkgver=2.1.19
pkgrel=1
pkgdesc="The 8051 simulator for teachers and students."
arch=('any')
license=('Custom')
url="http://www.edsim51.com/"
depends=('java-runtime' 'sh')
makedepends=('unzip')
source=("http://www.edsim51.com/8051simulator/edsim51di.zip"
        edsim51)
md5sums=('c0b5d0a37ed468db17fdf909357581a6'
         'a5b9584919a20455fac2eef330bd8c61')

_pkgname=edsim51di

package() {
  cd ${srcdir}/${_pkgname}

  install -d "${pkgdir}"/usr/share/java/${_pkgname}
  install -m644 edsim51di.jar "${pkgdir}"/usr/share/java/${_pkgname}/

  install -d "${pkgdir}"/usr/share/java/${_pkgname}/lib
  install -m644 lib/edsim51sh.jar "${pkgdir}"/usr/share/java/${_pkgname}/lib

  install -d "${pkgdir}"/usr/local/bin
  install -m755 ${srcdir}/edsim51 "${pkgdir}"/usr/local/bin/
}
