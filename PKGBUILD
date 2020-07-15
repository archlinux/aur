# Maintainer: Rod Kay   <charlie5 on #ada at freenode.net>

pkgname=gnatsymbolize
pkgver=2020
pkgrel=1
pkgdesc="Translates addresses into their corresponding filename, line number, and function names for Ada programs."

arch=('i686' 'x86_64')
url="https://libre.adacore.com/"
license=('GPL V3.0')

depends=('gcc-ada')
makedepends=('gprbuild')

source=('https://community.download.adacore.com/v1/ebef002ce60066e3befdd1a4a0980f3ab8f1b551?filename=gnatsymbolize-2020-20200429-19987-src.tar.gz')
sha1sums=('ebef002ce60066e3befdd1a4a0980f3ab8f1b551')


build()
{
  cd "$srcdir/gnatsymbolize-2020-20200429-19987-src"
  gprbuild gnatsymbolize.adb
}


package()
{
  cd "$srcdir/gnatsymbolize-2020-20200429-19987-src"
  mkdir -p "$pkgdir/usr/bin"
  cp gnatsymbolize $pkgdir/usr/bin
}
