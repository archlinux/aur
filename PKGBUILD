# Maintainer: Albert Graef <aggraef at gmail dot com>
# Contributor: bjoern lindig bjoern dot lindig at googlemail dot com

pkgname=pdl2ork-pure
_pkgname=pd-pure
pkgver=0.20
pkgrel=1
pkgdesc="Loader plugin for the Pure programming language, Pd-L2Ork version"
arch=('i686' 'x86_64')
url="http://purelang.bitbucket.org/"
depends=('pd-l2ork' 'pure')
license=('custom')
source=(https://bitbucket.org/purelang/pure-lang/downloads/$_pkgname-$pkgver.tar.gz)
md5sums=('a11b26543f3f865aa80b113e89ba6be8')

build() {
  cd $srcdir/$_pkgname-$pkgver
  make PD=pd-l2ork prefix=/usr
}

package() {
  cd $srcdir/$_pkgname-$pkgver
  make PD=pd-l2ork prefix=/usr DESTDIR=$pkgdir install
}
