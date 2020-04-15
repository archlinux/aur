# Maintainer: Maarten van Gompel <proycon at anaproy dot nl>
pkgname=frogdata
pkgver=0.18
pkgrel=1
pkgdesc="Data for Frog. Frog is an integration of memory-based natural language processing (NLP) modules developed for Dutch."
arch=('any')
license=('GPL3')
depends=()
makedepends=()
options=(!libtool)
_gituser="LanguageMachines"
_gitname="frogdata"
url="http://languagemachines.github.io/frog"
source=(https://github.com/LanguageMachines/frogdata/archive/v0.18.tar.gz)
md5sums=(67be6c0d9f14dec027a83312520f115c)

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
