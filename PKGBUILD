# Maintainer: Maarten van Gompel <proycon at anaproy.nl>
# Contributor: Bjorn Arild Maeland <bjorn.maeland at gmail dot com>

pkgname=timbl
pkgver=6.7
pkgrel=1
pkgdesc="Tilburg Memory-Based Learner, implementations of k-nearest neighbour classification "
arch=('i686' 'x86_64')
url="https://languagemachines.github.io/timbl/"
license=('GPL')
depends=('gcc-libs' 'libxml2' 'ticcutils>=0.24')
makedepends=('libtool' 'autoconf' 'autoconf-archive')
install=timbl.install
options=(!libtool)
_gituser="LanguageMachines"
_gitname="timbl"
source=(https://github.com/LanguageMachines/timbl/archive/v6.7.tar.gz)
noextract=()
md5sums=(524e579ae6215d9300c9242560ef98b0)

build() {
  cd $srcdir/$pkgname-$pkgver
  bash bootstrap.sh
  ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var
  make || return 1
}

package() {
  cd $srcdir/$pkgname-$pkgver
  make DESTDIR=$pkgdir install
}
