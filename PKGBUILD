# Contributor: Robson Peixoto <robsonpeixoto@gmail.com>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=bibtool
pkgver=2.68
pkgrel=4
pkgdesc="Command line manipulation of BibTeX files."
arch=('i686' 'x86_64')
url="http://www.gerd-neugebauer.de/software/TeX/BibTool/en/"
license=('GPL')
depends=('glibc' 'texlive-bin')
source=(http://www.gerd-neugebauer.de/software/TeX/BibTool/BibTool-$pkgver.tar.gz)
sha256sums=('c47d78add3179095e087231cf19f4a73c83db82db44413d2e674b7a402615572')

build() {
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
