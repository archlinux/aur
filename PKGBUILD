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
sha256sums=('7134ce3a05fe94c04b88f18261139656ac4c0c0893de15acc0daabc90248b8fa')

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
