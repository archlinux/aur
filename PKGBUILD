# Contributor: Patrick Kelly <kameo76890 at gmail dot com>
# Contributor: Georgios  Tsalikis <aliverius somewhere near tsalikis and a net>
# Contributor: Rod Kay <charlie5 on #ada at freenode.net>

pkgname=xmlada
pkgver=2015
pkgrel=1
pkgdesc="A full XML suite for Ada"

arch=('i686' 'x86_64')
url="http://libre.adacore.com/libre/tools/xmlada/"
license=('GPL')

depends=("gcc-ada")
source=(http://mirrors.cdn.adacore.com/art/949752df2432aed8d06c48d57cea71f38d0517cc)
md5sums=('98c96b8c6a877617ec4da3ef6a03288a')

build() {
  cd $srcdir/$pkgname-gpl-$pkgver-src
  ./configure --prefix=/usr
  make  
}

package() {
  cd $srcdir/$pkgname-gpl-$pkgver-src
  make -j1 prefix=$pkgdir/usr install 
}
