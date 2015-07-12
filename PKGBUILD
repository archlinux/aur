# Contributor: Robson Peixoto <robsonpeixoto@gmail.com>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=bibtool
pkgver=2.61
pkgrel=1
pkgdesc="Command line manipulation of BibTeX files."
arch=('i686' 'x86_64')
url="http://www.gerd-neugebauer.de/software/TeX/BibTool/"
license=('GPL')
depends=('texlive-bin')
makedepends=('tar')
source=(http://ctan.mirrors.hoobly.com/biblio/bibtex/utils/bibtool.zip)
md5sums=('1395c3322550a60f50053d639935b380')
noextract=("BibTool-$pkgver.tar.gz")


build() {
  cd "$srcdir/bibtool"
  bsdtar -xf BibTool-$pkgver.tar.gz
  cd BibTool
  autoreconf
  ./configure --prefix=/usr
  make 
}

package() {
  cd "$srcdir/bibtool/BibTool"
  install -d "$pkgdir"/usr/bin
  make INSTALLPREFIX=$pkgdir install 
}
