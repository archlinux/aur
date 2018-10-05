# Maintainer:  Rod Kay               <charlie5 on #ada at freenode.net>

pkgname=gnatsymbolize
pkgver=2018
pkgrel=1
pkgdesc="Translates addresses into their corresponding filename, line number, and function names for Ada programs."

arch=('i686' 'x86_64')
url="https://libre.adacore.com/"
license=('GPL V3.0')

depends=('gcc-ada>=8.2.1' 'gcc-ada<9.0.0')
makedepends=('gprbuild>=2018')

source=('http://mirrors.cdn.adacore.com/art/5b0819dfc7a447df26c27a6d')
sha1sums=('cf7df21f42b67d46b2acc9eda45f37dd3827271c')


build()
{
  cd "$srcdir/gnatsymbolize-gpl-2018-src"
  gprbuild gnatsymbolize.adb
}


package()
{
  cd "$srcdir/gnatsymbolize-gpl-2018-src"
  mkdir -p "$pkgdir/usr/bin"
  cp gnatsymbolize $pkgdir/usr/bin
}
