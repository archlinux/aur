# Maintainer: Maarten van Gompel <proycon at anaproy dot nl>
pkgname=frog
pkgver=0.12.20
pkgrel=1
pkgdesc="Frog is an integration of memory-based natural language processing (NLP) modules developed for Dutch. It includes a tokenizer, part-of-speech tagger, lemmatizer, morphological analyser, named entity recognition, shallow parser and dependency parser."
arch=('i686' 'x86_64')
license=('GPL3')
depends=('ticcutils>=0.7' 'ucto>=0.8.0' 'libfolia>=0.13' 'icu' 'libxml2' 'python2' 'frogdata>=0.6' 'timbl' 'mbt')
makedepends=('libtool' 'autoconf')
options=(!libtool)
url="http://ilk.uvt.nl/frog"
source=("http://software.ticc.uvt.nl/$pkgname-$pkgver.tar.gz")
md5sums=('14d6f925d12e2c80c97373aceb0e7404')

build() {
  cd $srcdir/$pkgname-$pkgver
  ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var --with-python=/usr/bin/python2
  make
}

package() {
  cd $srcdir/$pkgname-$pkgver
  make DESTDIR=$pkgdir install
}
