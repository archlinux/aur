# Contributor: Robson Peixoto <robsonpeixoto@gmail.com>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=bibtool
pkgver=2.67
pkgrel=2
pkgdesc="Command line manipulation of BibTeX files."
arch=('i686' 'x86_64')
url="http://www.gerd-neugebauer.de/software/TeX/BibTool/en/"
license=('GPL')
depends=('texlive-bin')
makedepends=('tar')
source=(http://www.gerd-neugebauer.de/software/TeX/BibTool/BibTool-$pkgver.tar.gz)
sha256sums=('5b6c4160975a926356e8e59d0e5c01ac2a7be337ecace2494918fc2a46d9d784')
noextract=("BibTool-$pkgver.tar.gz")

build() {
  tar -xf BibTool-$pkgver.tar.gz
  cd BibTool
  autoreconf
  ./configure --prefix=/usr
  make 
}

package() {
  cd BibTool
  install -d "$pkgdir"/usr/bin
  make INSTALLPREFIX="$pkgdir" install 
}
