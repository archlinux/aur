# Contributor: Robson Peixoto <robsonpeixoto@gmail.com>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=bibtool
pkgver=2.68
pkgrel=2
pkgdesc="Command line manipulation of BibTeX files."
arch=('i686' 'x86_64')
url="http://www.gerd-neugebauer.de/software/TeX/BibTool/en/"
license=('GPL')
depends=('glibc' 'texlive-bin')
makedepends=('tar')
source=(http://www.gerd-neugebauer.de/software/TeX/BibTool/BibTool-$pkgver.tar.gz)
sha256sums=('7134ce3a05fe94c04b88f18261139656ac4c0c0893de15acc0daabc90248b8fa')
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
