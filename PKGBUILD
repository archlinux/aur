# Contributor: Rod Kay               <charlie5 on #ada at freenode.net>
# Contributor: Pierre-Marie de Rodat <pmderodat@kawie.fr>

pkgname=gnat_util
pkgver=2015
pkgrel=1
pkgdesc="Provides internal GNAT compiler components in a library which is used by (at least) ASIS and GNATColl."

options=('!emptydirs')

arch=('i686' 'x86_64')
url="http://sourceforge.net/projects/gnatutil"
license=('GPL V3.0 without any Runtime Exception')

depends=('gcc-ada')
makedepends=('gcc-ada')


source=('gnat_util-gpl-2015-src.tar.gz::http://mirrors.cdn.adacore.com/art/564b3e2ec8e196b040fbd13b')
sha256sums=('f07bf08cd9aad318ff7d761a167a2d134c9106e58bdc7d400d624b8962de7b16')


_pkg_src_dir="$pkgname-gpl-$pkgver-src"
_make_flags='ENABLE_SHARED=yes'


build()
{
  cd "$srcdir/$_pkg_src_dir"
  make $_make_flags
}


package()
{
  cd "$srcdir/$_pkg_src_dir"
  make prefix="$pkgdir/usr" $_make_flags install
}
