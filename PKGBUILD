# Maintainer: Geballin - Guillaume Ballin <macniaque at free dot fr>
pkgname=robodoc
pkgver=4.99.44
pkgrel=2
pkgdesc="ROBODoc is program documentation tool. It works with many programming languages: For instance C, Pascal, Shell Scripts, Assembler, COBOL, Occam, Postscript, Forth, Tcl/Tk, C++, Java -- basically any program in which you can use remarks/comments."
url="https://rfsber.home.xs4all.nl/Robo/"
arch=('x86_64' 'i686')
license=('GPLv3')
depends=()
optdepends=()
makedepends=(gcc make)
conflicts=()
replaces=()
backup=()
install=
source=("http://rfsber.home.xs4all.nl/Robo/archives/robodoc-${pkgver}.tar.gz"
       "troff_generator.c.patch")

md5sums=('ad983c18379800859158b0fedc8378f3'
	'9c1cd4e54928c602a931f54b300b989d')

build() {
  tar xzf robodoc-${pkgver}.tar.gz
  cd robodoc-${pkgver}
  patch -Np1 -i ../../troff_generator.c.patch
  ./configure --prefix=/usr
  make
  }

package() {
  cd robodoc-${pkgver}
  make DESTDIR="${pkgdir}" install
  }
