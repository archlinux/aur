# Maintainer: Maarten van Gompel <proycon at anaproy dot nl>
# Contributor: Bart Verhoeven <nepherte at archlinux dot us>
pkgname=mbt
pkgver=3.3.2
pkgrel=1
pkgdesc="Memory-based tagger-generator and tagger in one."
arch=('i686' 'x86_64')
license=('GPL3')
depends=('ticcutils>=0.17' 'timbl' 'timblserver')
makedepends=('libtool' 'autoconf' 'autoconf-archive')
options=(!libtool)
url="https://languagemachines.github.io/mbt"
_gituser="LanguageMachines"
_gitname="mbt"
source=(https://github.com/LanguageMachines/mbt/archive/v3.3.2.tar.gz)
md5sums=(f46071e1dc82fa41034116923ba6320d)

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

