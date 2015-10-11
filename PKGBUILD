# Maintainer: Sebastian Wilzbach <sebi [at] wilzbach [dot] me>
# Maintainer: trex279 <gmail.com: trex279>

pkgname=bib2x
pkgver=0.9.0
pkgrel=1
pkgdesc="The Tool For Manipulating and Converting BibTeX-Libraries"
arch=('i686' 'x86_64')
url="http://www.xandi.eu/bib2x/"
license=('GPL')
source=("http://www.xandi.eu/bib2x/files/dist/bib2x_0.9_src.tgz")

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  
  patch -Np1 -i "${startdir}/generic.h.patch"
  
  ./configure --prefix=/usr

  make ECHO=echo
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

   make prefix="$pkgdir/usr/" install
}

md5sums=('58dc19125305762eba9725260e191622')
