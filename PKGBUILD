# Contributor: Sietse van der Molen
# Contributor: Rod Kay <charlie5 on #ada at freenode.net>

pkgname=gprbuild
pkgver=2016
pkgrel=1

depends=('gcc-ada' 'xmlada')

pkgdesc="Software tool designed to help automate the construction of multi-language systems"

arch=('any')
license=('GPL')
url="http://www.adacore.com/gnatpro/toolsuite/gprbuild/"

source=("http://mirrors.cdn.adacore.com/art/57399662c7a447658e0affa8")
sha256sums=('d51659454bc0aaf1a9a9f1d05aab469a1f3d900065a4542123d3a59ab067275d')



prepare()
{
  WRKSRC=$srcdir/$pkgname-gpl-$pkgver-src

  cp $srcdir/Makefile.archy ${WRKSRC}
}



build() 
{
  cd $pkgname-gpl-$pkgver-src

  ./configure --prefix="/usr"
  make
}



package() 
{
  cd $pkgname-gpl-$pkgver-src

  DESTDIR=$pkgdir  PREFIX=/usr  make  prefix="$pkgdir/usr"  install
}
