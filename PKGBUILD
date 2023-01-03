# Maintainer: Maarten van Gompel <proycon at anaproy dot nl>
pkgname=frog
pkgver=0.26
pkgrel=1
pkgdesc="Frog is an integration of memory-based natural language processing (NLP) modules developed for Dutch. It includes a tokenizer, part-of-speech tagger, lemmatizer, morphological analyser, named entity recognition, shallow parser and dependency parser."
arch=('i686' 'x86_64')
license=('GPL3')
depends=('ticcutils>=0.24' 'ucto>=0.21' 'libfolia>=2.4' 'icu' 'libxml2'  'frogdata>=0.18' 'timbl>=6.5' 'mbt>=3.6' 'mbtserver')
makedepends=('libtool' 'autoconf')
options=(!libtool)
_gituser="LanguageMachines"
_gitname="frog"
url="http://languagemachines.github.io/frog"
source=(https://github.com/LanguageMachines/frog/archive/v0.26.tar.gz)
md5sums=(ca21a163139f32272b48a5910134dbed)

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
