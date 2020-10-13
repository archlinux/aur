# Maintainer:  Rod Kay               <charlie5 on #ada at freenode.net>
# Contributor: Pierre-Marie de Rodat <pmderodat@kawie.fr>

pkgname=gnat_util
pkgver=2020
pkgrel=1
pkgdesc="Internal GNAT compiler components used by (at least) ASIS."

arch=('i686' 'x86_64')
url="https://libre.adacore.com/"
license=('GPL V3.0 without any Runtime Exception')

depends=('gcc-ada')
makedepends=('gprbuild')

source=('https://community.download.adacore.com/v1/26bd253101b46706f5f8e3d0ca8b3107cde99e99?filename=gnat_util-20.0w-20190814-1532A-src.tar.gz')
sha1sums=('26bd253101b46706f5f8e3d0ca8b3107cde99e99')

_pkg_src_dir="gnat_util-20.0w-20190814-1532A-src"


build()
{
  cd "$srcdir/$_pkg_src_dir"
  make 'ENABLE_SHARED=yes'
}


package()
{
  cd "$srcdir/$_pkg_src_dir"
  make 'ENABLE_SHARED=yes' prefix="$pkgdir/usr" install
}
