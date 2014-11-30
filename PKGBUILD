# Maintainer: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>

pkgname=tmx2txt
pkgver=1.0
pkgrel=1
pkgdesc="Simple tcl/tk command-line script for converting TMX files to plain text"
arch=('i686' 'x86_64')
url="http://www.omegat.org/en/resources.html"
license=('GPL')
depends=('tcl' 'tk')
source=(http://www.omegat.org/omegatk/$pkgname.zip)
md5sums=('4e23eb754a7a08b6a537ff45e41ff8fd')

package() {
  cd "${srcdir}"/${pkgname}_${pkgver}

  install -D -m644 readme.txt "${pkgdir}"/usr/share/$pkgname/README
  install -D -m755 $pkgname.tcl "${pkgdir}"/usr/share/$pkgname/$pkgname.tcl
  install -d "${pkgdir}"/usr/bin
  ln -s /usr/share/$pkgname/$pkgname.tcl "${pkgdir}"/usr/bin/$pkgname
}
