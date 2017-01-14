# Contributor: Robson Peixoto <robsonpeixoto@gmail.com>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=bibtool
pkgver=2.67
pkgrel=1
pkgdesc="Command line manipulation of BibTeX files."
arch=('i686' 'x86_64')
url="http://www.gerd-neugebauer.de/software/TeX/BibTool/en/"
license=('GPL')
depends=('texlive-bin')
makedepends=('tar')
source=(http://www.gerd-neugebauer.de/software/TeX/BibTool/BibTool-$pkgver.tar.gz)
md5sums=('c14d5a162a0e28cc6d69fc4333b59713')
noextract=("BibTool-$pkgver.tar.gz")

build() {
  cd "$srcdir/"
  tar -xf BibTool-$pkgver.tar.gz
  cd BibTool
  autoreconf
  ./configure --prefix=/usr
  make 
}

package() {
  cd "$srcdir/BibTool"
  install -d "$pkgdir"/usr/bin
  make INSTALLPREFIX=$pkgdir install 
}
