# Maintainer:  Rod Kay               <charlie5 on #ada at freenode.net>

pkgname=aunit
pkgver=2018
pkgrel=1
pkgdesc="Ada Unit Testing Framework"

arch=('i686' 'x86_64')
url="https://libre.adacore.com/"
license=('GPL V3.0')

depends=('gcc-ada>=8.2.1' 'gcc-ada<9.0.0')
makedepends=('gprbuild>=2018')

source=('http://mirrors.cdn.adacore.com/art/5b0819e0c7a447df26c27ab3')
sha1sums=('2b10d2c30e12d2d06af216c15776a2282c784d71')

_pkg_src_dir="$pkgname-gpl-$pkgver-src"


build()
{
  cd "$srcdir/$_pkg_src_dir"
  make
}


package()
{
  cd "$srcdir/$_pkg_src_dir"
  make INSTALL="$pkgdir/usr" install
}
