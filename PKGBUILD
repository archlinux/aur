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

source=("gprbuild-gpl-2016-src.tar.gz::http://mirrors.cdn.adacore.com/art/57399662c7a447658e0affa8"
        "gprbuild-gpl-2016-x86_64-linux-bin::http://mirrors.cdn.adacore.com/art/5739cbf1c7a447658d00e326")

sha1sums=('c85b877596dbc53bfc39ec5b23f674e8463677ce'
          '270aa41c2ed6381460502ac00ecef7dfefd07000')


build() 
{
  cd $pkgname-gpl-$pkgver-src

  export PATH=$srcdir/gprbuild-gpl-2016-x86_64-linux-bin/bin:$PATH
  ./configure --prefix="/usr"
  make
}


package() 
{
  cd $pkgname-gpl-$pkgver-src

  DESTDIR=$pkgdir  PREFIX=/usr  make  prefix="$pkgdir/usr"  install
}
