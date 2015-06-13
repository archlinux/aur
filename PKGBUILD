# Maintainer: Albert Graef <aggraef at gmail dot com>
# Contributor: bjoern lindig bjoern dot lindig at googlemail dot com

pkgname=pd-faust
pkgver=0.9
pkgrel=2
pkgdesc="Run Faust signal processors in Pd"
arch=('i686' 'x86_64')
url="http://purelang.bitbucket.org/"
depends=('pd' 'pure' 'pd-pure' 'pure-faust' 'pure-audio' 'pure-midi' 'pure-stldict')
makedepends=('faust')
license=('LGPL3')
groups=(pure-complete pure-multimedia)
source=(https://bitbucket.org/purelang/pure-lang/downloads/$pkgname-$pkgver.tar.gz)
md5sums=('60b4a820517f6fd3e0e9c1abd1bb37e0')

build() {
  cd $srcdir/$pkgname-$pkgver
  make prefix=/usr PUREC_FLAGS=-mcpu=generic
}

package() {
  cd $srcdir/$pkgname-$pkgver
  make DESTDIR=$pkgdir prefix=/usr install 
}
