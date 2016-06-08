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

source=(http://mirrors.cdn.adacore.com/art/57399978c7a447658e0affc0
        http://mirrors.cdn.adacore.com/art/5739cbf1c7a447658d00e326)

sha1sums=('a9c840d9d05ed865aa7c960d9f27cf7cd93e12b9'
          '270aa41c2ed6381460502ac00ecef7dfefd07000')


build()
{
  cd $srcdir/$pkgname-gpl-$pkgver-src

  export PATH=$srcdir/gprbuild-gpl-2016-x86_64-linux-bin/bin:$PATH

  ./configure --prefix=/usr
  make static relocatable
}


package() 
{
  cd $srcdir/$pkgname-gpl-$pkgver-src

  make -j1 prefix=$pkgdir/usr install-clean install-static install-relocatable
}
