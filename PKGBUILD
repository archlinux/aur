# Maintainer: Maarten van Gompel <proycon at anaproy dot nl>
pkgname=ucto
pkgver=0.14.1
pkgrel=1
pkgdesc="An advanced rule-based (regular-expression) and unicode-aware tokenizer for various languages. Tokenization is an essential first step in any NLP pipeline."
arch=('i686' 'x86_64')
license=('GPL3')
depends=('ticcutils>=0.16.1' 'icu' 'libxml2' 'libfolia>=1.10.1' 'uctodata>=0.5')
makedepends=('libtool' 'autoconf' 'autoconf-archive')
options=(!libtool)
_gituser="LanguageMachines"
_gitname="ucto"
url="https://languagemachines.github.io/ucto"
source=(https://github.com/LanguageMachines/ucto/archive/v0.14.1.tar.gz)
md5sums=(607c3237de7e0403f14769aae74d9c19)

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
