# Maintainer: Albert Graef <aggraef at gmail dot com>

pkgname=pdl2ork-faust
_pkgname=pd-faust
pkgver=0.14
pkgrel=1
pkgdesc="Run Faust signal processors in Pd, Pd-L2Ork version"
arch=('i686' 'x86_64')
url="http://purelang.bitbucket.org/"
depends=('pd-l2ork' 'pure'  'pdl2ork-pure' 'pure-faust' 'pure-audio' 'pure-midi' 'pure-stldict')
makedepends=('faust')
license=('LGPL3')
source=(https://bitbucket.org/purelang/pure-lang/downloads/$_pkgname-$pkgver.tar.gz)
md5sums=('182b058e4c5c9ebad80916a99ee4c88e')

build() {
  cd $srcdir/$_pkgname-$pkgver
  make prefix=/usr PUREC_FLAGS=-mcpu=generic
}

package() {
  cd $srcdir/$_pkgname-$pkgver
  make PD=pd-l2ork DESTDIR=$pkgdir prefix=/usr install 
}
