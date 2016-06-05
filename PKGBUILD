# Contributor: Rod Kay               <charlie5 on #ada at freenode.net>
# Contributor: Pierre-Marie de Rodat <pmderodat@kawie.fr>

pkgname=gnat_util
pkgver=2016
pkgrel=1
pkgdesc="Provides internal GNAT compiler components in a library which is used by (at least) ASIS and GNATColl."

options=('!emptydirs')

arch=('i686' 'x86_64')
url="http://sourceforge.net/projects/gnatutil"
license=('GPL V3.0 without any Runtime Exception')

depends=('gcc-ada')
makedepends=('gcc-ada')


source=('gnat_util-gpl-2016-src.tar.gz::http://mirrors.cdn.adacore.com/art/57399637c7a447658e0affa6')
sha256sums=('8e76d7eb1cbae1d3040b9e4196ab07d6e0dd5d4eeb3f5e0fbeb267b1a3470af5')


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
