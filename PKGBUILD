# Contributor: Jordi De Groof <jordi dot degroof at gmail dot com>
# Contributor: Andre Klitzing <aklitzing () gmail () com>
pkgname=lcov
pkgver=1.11
pkgrel=2
pkgdesc="front-end for GCC's coverage testing tool gcov"
arch=('any')
url="http://ltp.sourceforge.net/coverage/lcov.php"
license=('GPL')
depends=('perl')
source=("http://downloads.sourceforge.net/ltp/$pkgname-$pkgver.tar.gz"
        "demangle-fixup.patch"
        "fix-undef-behaviour.patch"
        "handle-equals-signs.patch")
sha1sums=('bf8ed68c06805a71528a2a67dd714830afd3ccb5'
          'bed4025628c45e2ed23ffa9b8dafc8926e874193'
          '6379bbc44710f3b3a16d61ff1c4e93d3c2430a69'
          'a795e5bc0018a8a6210a1921a46f6a83cac78973')

prepare()
{
  cd "$srcdir/$pkgname-$pkgver"
  patch -p1 -i $srcdir/demangle-fixup.patch
  patch -p1 -i $srcdir/fix-undef-behaviour.patch
  patch -p1 -i $srcdir/handle-equals-signs.patch
}


package()
{
 cd "$srcdir/$pkgname-$pkgver"

 make PREFIX="$pkgdir" install || return 1
}

# vim:set ts=2 sw=2 et:
