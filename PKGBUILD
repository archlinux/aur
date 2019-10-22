# Maintainer: Maarten van Gompel <proycon at anaproy dot nl>
pkgname=frog
pkgver=0.19
pkgrel=2
pkgdesc="Frog is an integration of memory-based natural language processing (NLP) modules developed for Dutch. It includes a tokenizer, part-of-speech tagger, lemmatizer, morphological analyser, named entity recognition, shallow parser and dependency parser."
arch=('i686' 'x86_64')
license=('GPL3')
depends=('ticcutils>=0.21' 'ucto>=0.16' 'libfolia>=2.0' 'icu' 'libxml2'  'frogdata>=0.17' 'timbl' 'mbt' 'mbtserver')
makedepends=('libtool' 'autoconf')
options=(!libtool)
_gituser="LanguageMachines"
_gitname="frog"
url="http://languagemachines.github.io/frog"
source=(https://github.com/LanguageMachines/frog/archive/v0.19.tar.gz)
md5sums=(268aec814d1bbade81f9bfc950b4bdab)

build() {
  cd $srcdir/$pkgname-$pkgver
  bash bootstrap.sh
  ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var
  make
}

package() {
  cd $srcdir/$pkgname-$pkgver
  make DESTDIR=$pkgdir install
}
