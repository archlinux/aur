# Maintainer: Maarten van Gompel <proycon at anaproy dot nl>
pkgname=ucto
pkgver=0.8.0
pkgrel=1
pkgdesc="An advanced rule-based (regular-expression) and unicode-aware tokenizer for various languages. Tokenization is an essential first step in any NLP pipeline."
arch=('i686' 'x86_64')
license=('GPL3')
depends=('ticcutils>=0.7' 'icu' 'libxml2' 'libfolia>=0.13')
makedepends=('libtool' 'autoconf')
options=(!libtool)
url="http://ilk.uvt.nl/ucto"
source=("http://software.ticc.uvt.nl/$pkgname-$pkgver.tar.gz")
md5sums=('67750bc54be80bdc9bb47acf8e5aa616')

build() {
  cd $srcdir/$pkgname-$pkgver
  ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var
  make
}

package() {
  cd $srcdir/$pkgname-$pkgver
  make DESTDIR=$pkgdir install
}
