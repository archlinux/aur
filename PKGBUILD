# Maintainer: Maarten van Gompel <proycon at anaproy dot nl>
pkgname=frog
pkgver=0.32
pkgrel=1
pkgdesc="Frog is an integration of memory-based natural language processing (NLP) modules developed for Dutch. It includes a tokenizer, part-of-speech tagger, lemmatizer, morphological analyser, named entity recognition, shallow parser and dependency parser."
arch=('i686' 'x86_64')
license=('GPL3')
depends=('ticcutils>=0.34' 'ucto>=0.30' 'libfolia>=2.17' 'icu' 'libxml2'  'frogdata>=0.22' 'timbl>=6.9' 'mbt>=3.10' 'mbtserver')
makedepends=('libtool' 'autoconf')
options=(!libtool)
_gituser="LanguageMachines"
_gitname="frog"
url="http://languagemachines.github.io/frog"
source=(https://github.com/LanguageMachines/frog/archive/v0.32.tar.gz)
md5sums=(03cf4862f2daee26d830f394a0536dab)

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
