# Maintainer: Albert Graef <aggraef at gmail dot com>
# Contributor: bjoern lindig bjoern dot lindig at googlemail dot com

pkgname=pd-faust
pkgver=0.16
pkgrel=1
pkgdesc="Run Faust signal processors in Pd"
arch=('i686' 'x86_64')
url="http://purelang.bitbucket.org/"
depends=('pd' 'pure' 'pd-pure' 'pure-faust' 'pure-audio' 'pure-midi' 'pure-stldict')
makedepends=('faust')
license=('LGPL3')
groups=(pure-complete pure-multimedia)
source=(https://github.com/agraef/pure-lang/releases/download/$pkgname-$pkgver/$pkgname-$pkgver.tar.gz)
md5sums=('9211436e6ec93339a1b2dbd4675cfa81')

build() {
  cd $srcdir/$pkgname-$pkgver
  make prefix=/usr PUREC_FLAGS=-mcpu=generic
}

package() {
  cd $srcdir/$pkgname-$pkgver
  make DESTDIR=$pkgdir prefix=/usr install 
}
