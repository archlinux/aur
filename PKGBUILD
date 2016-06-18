# Contributor: Robson Peixoto <robsonpeixoto@gmail.com>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=bibtool
pkgver=2.65
pkgrel=1
pkgdesc="Command line manipulation of BibTeX files."
arch=('i686' 'x86_64')
url="http://www.gerd-neugebauer.de/software/TeX/BibTool/en/"
license=('GPL')
depends=('texlive-bin')
makedepends=('tar')
source=(http://mirrors.ctan.org/biblio/bibtex/utils/bibtool/BibTool-$pkgver.tar.gz)
md5sums=('e0d44f171d1fb0afce4067a508326c31')
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
