# Contributor: Rod Kay               <charlie5 on #ada at freenode.net>
# Contributor: Pierre-Marie de Rodat <pmderodat@kawie.fr>

pkgname=gnat_util
pkgver=2017
pkgrel=2
pkgdesc="Provides internal GNAT compiler components in a library which is used by (at least) ASIS and GNATColl."

options=('!emptydirs')

arch=('i686' 'x86_64')
url="http://sourceforge.net/projects/gnatutil"
license=('GPL V3.0 without any Runtime Exception')

#depends=('gcc-ada' 'prepare_gnat_util')
depends=('gcc-ada')
makedepends=('gcc-ada' 'gprbuild')


source=('http://mirrors.cdn.adacore.com/art/591c45e2c7a447af2deed037')
sha1sums=('00a231b45e25ea524a144111a524262184ceb876')


_pkg_src_dir="$pkgname-gpl-$pkgver-src"
#_make_flags='ENABLE_SHARED=yes'


build()
{
  cd "$srcdir/$_pkg_src_dir"
  make
#  make $_make_flags
}


package()
{
  cd "$srcdir/$_pkg_src_dir"
  make prefix="$pkgdir/usr" install
#  make prefix="$pkgdir/usr" $_make_flags install
}
