# Maintainer: Viktor Drobot (aka dviktor) linux776 [at] gmail [dot] com

pkgname=avrcalc
pkgver=0.2
pkgrel=2
pkgdesc="Calculator to speed development of Atmel AVRs"
arch=(i686 x86_64)
url="https://sourceforge.net/projects/avrcalc"
license=(GPL)
depends=(qt4)
source=("https://sourceforge.net/projects/${pkgname}/files/${pkgname}/${pkgver}/${pkgname}.tar.gz")
sha256sums=('1c4edf39dcf1131676cc50de300cf20605df5343c0401edb4668f21b0455c78a')

build() {
  cd ${srcdir}/${pkgname}

  qmake-qt4 avrcalc.pro
  make
}

package() {
  install -Dm755 ${srcdir}/${pkgname}/avrcalc ${pkgdir}/usr/bin/avrcalc
}
