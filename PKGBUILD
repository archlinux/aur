# Maintainer: Albert Graef <aggraef at gmail dot com>
# Contributor: bjoern lindig bjoern dot lindig at googlemail dot com

pkgname=pdl2ork-pure
_pkgname=pd-pure
pkgver=0.24
pkgrel=1
pkgdesc="Loader plugin for the Pure programming language, Pd-L2Ork version"
arch=('i686' 'x86_64')
url="http://purelang.bitbucket.org/"
depends=('pd-l2ork' 'pure')
license=('custom')
source=(https://bitbucket.org/purelang/pure-lang/downloads/$_pkgname-$pkgver.tar.gz)
md5sums=('6d1742ea78f329c4625d037926593275')

build() {
  cd $srcdir/$_pkgname-$pkgver
  make PD=pd-l2ork prefix=/usr
}

package() {
  cd $srcdir/$_pkgname-$pkgver
  make PD=pd-l2ork prefix=/usr DESTDIR=$pkgdir install
}
