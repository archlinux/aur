# Maintainer:  Rod Kay               <charlie5 on #ada at freenode.net>
# Contributor: Pierre-Marie de Rodat <pmderodat@kawie.fr>

pkgname=gnat_util
pkgver=2018
pkgrel=1
pkgdesc="Internal GNAT compiler components used by (at least) ASIS."

arch=('i686' 'x86_64')
url="https://libre.adacore.com/"
license=('GPL V3.0 without any Runtime Exception')

depends=('gcc-ada>=8.2.1' 'gcc-ada<9.0.0')
makedepends=('gprbuild>=2018')

source=('http://mirrors.cdn.adacore.com/art/5b0819dfc7a447df26c27a6b')
sha1sums=('462a1304d1ed1ee5a37bfc6e956fa8b07896b715')

_pkg_src_dir="$pkgname-gpl-$pkgver-src"


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
