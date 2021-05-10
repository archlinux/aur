# Maintainer: Jose Riha < jose 1711 gmail com >

pkgname=qscrabble3d
pkgver=3.1.4
pkgrel=1
pkgdesc="Highly customizable Scrabble game (classic, SuperScrabble, 3D games) - Qt version"
arch=('x86_64')
url="https://sourceforge.net/projects/scrabble/"
conflicts=('scrabble3d')
license=('GPL')
md5sums=('d0806eb530f4d93db1302bc8e2c55093')
depends=('qt4pas')

source=(http://downloads.sourceforge.net/project/scrabble/Main_Program/Linux/QScrabble3D-${arch}.deb)

package() {
  cd "${srcdir}"

  ar x QScrabble3D-*.deb
  tar xf data.tar.xz -C ${pkgdir}
  chmod -R 755 ${pkgdir}/usr
  rm ${pkgdir}/usr/lib/libQt4Pas.*
  rmdir ${pkgdir}/usr/lib
}
