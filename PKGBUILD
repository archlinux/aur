# Maintainer: Maarten van Gompel <proycon at anaproy dot nl>
pkgname=uctodata
pkgver=0.5
pkgrel=1
pkgdesc="An advanced rule-based (regular-expression) and unicode-aware tokenizer for various languages. Tokenization is an essential first step in any NLP pipeline. This package contains the necessary data."
arch=('any')
license=('GPL3')
makedepends=('libtool' 'autoconf' 'autoconf-archive')
options=(!libtool)
_gituser="LanguageMachines"
_gitname="uctodata"
url="https://languagemachines.github.io/ucto"
source=(https://github.com/LanguageMachines/uctodata/archive/v0.5.tar.gz)
md5sums=(2e8e9aea525db0cb8cd1a0c062d2d64d)

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
