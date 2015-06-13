# Maintainer: Albert Graef <aggraef at gmail dot com>

pkgname=pdextended-faust
_pkgname=pd-faust
pkgver=0.9
pkgrel=2
pkgdesc="Run Faust signal processors in Pd, Pd-Extended version"
arch=('i686' 'x86_64')
url="http://purelang.bitbucket.org/"
depends=('pd-extended' 'pure'  'pdextended-pure' 'pure-faust' 'pure-audio' 'pure-midi' 'pure-stldict')
makedepends=('faust')
license=('LGPL3')
source=(https://bitbucket.org/purelang/pure-lang/downloads/$_pkgname-$pkgver.tar.gz)
md5sums=('60b4a820517f6fd3e0e9c1abd1bb37e0')

build() {
  cd $srcdir/$_pkgname-$pkgver
  make prefix=/usr PUREC_FLAGS=-mcpu=generic
}

package() {
  cd $srcdir/$_pkgname-$pkgver
  make PD=pd-extended DESTDIR=$pkgdir prefix=/usr install 
}
