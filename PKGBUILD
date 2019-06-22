# Maintainer: Rod Kay   <charlie5 on #ada at freenode.net>

pkgname=gnatsymbolize
pkgver=2019
pkgrel=1
pkgdesc="Translates addresses into their corresponding filename, line number, and function names for Ada programs."

arch=('i686' 'x86_64')
url="https://libre.adacore.com/"
license=('GPL V3.0')

depends=('gcc-ada')
makedepends=('gprbuild')

source=('http://mirrors.cdn.adacore.com/art/5cc7d5e431e87a23952f18c4')
sha1sums=('bc7d103a3c25fa0575ec69e489c79f3805fcd131')


build()
{
  cd "$srcdir/gnatsymbolize-2019-20190429-19761-src"
  gprbuild gnatsymbolize.adb
}


package()
{
  cd "$srcdir/gnatsymbolize-2019-20190429-19761-src"
  mkdir -p "$pkgdir/usr/bin"
  cp gnatsymbolize $pkgdir/usr/bin
}
