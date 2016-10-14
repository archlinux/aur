# Maintainer: Albert Graef <aggraef at gmail dot com>

pkgname=pdl2ork-faust
_pkgname=pd-faust
pkgver=0.11
pkgrel=1
pkgdesc="Run Faust signal processors in Pd, Pd-L2Ork version"
arch=('i686' 'x86_64')
url="http://purelang.bitbucket.org/"
depends=('pd-l2ork' 'pure'  'pdl2ork-pure' 'pure-faust' 'pure-audio' 'pure-midi' 'pure-stldict')
makedepends=('faust')
license=('LGPL3')
source=(https://bitbucket.org/purelang/pure-lang/downloads/$_pkgname-$pkgver.tar.gz)
md5sums=('59f5369dd385c9837a8391df2e0f45e8')

build() {
  cd $srcdir/$_pkgname-$pkgver
  make prefix=/usr PUREC_FLAGS=-mcpu=generic
}

package() {
  cd $srcdir/$_pkgname-$pkgver
  make PD=pd-l2ork DESTDIR=$pkgdir prefix=/usr install 
}
