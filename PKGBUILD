# Contributor: Patrick Kelly <kameo76890 at gmail dot com>
# Contributor: Georgios  Tsalikis <aliverius somewhere near tsalikis and a net>
# Contributor: Rod Kay <charlie5 on #ada at freenode.net>

pkgname=xmlada
pkgver=2016
pkgrel=1
pkgdesc="A full XML suite for Ada"

arch=('i686' 'x86_64')
url="http://libre.adacore.com/libre/tools/xmlada/"
license=('GPL')

depends=("gcc-ada")

source=(http://mirrors.cdn.adacore.com/art/57399978c7a447658e0affc0)
md5sums=('631957d2f55277f1d58a68186fbf5022')


build()
{
  cd $srcdir/$pkgname-gpl-$pkgver-src

  ./configure --prefix=/usr
  make all
}


package() 
{
  cd $srcdir/$pkgname-gpl-$pkgver-src

  make -j1 prefix=$pkgdir/usr install 
}
