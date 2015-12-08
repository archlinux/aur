# Contributor: Jordi De Groof <jordi dot degroof at gmail dot com>
# Contributor: Andre Klitzing <aklitzing () gmail () com>

pkgname=lcov
pkgver=1.12
pkgrel=1
pkgdesc="front-end for GCC's coverage testing tool gcov"
arch=('any')
url="http://ltp.sourceforge.net/coverage/lcov.php"
license=('GPL')
depends=('perl')
source=("http://downloads.sourceforge.net/ltp/$pkgname-$pkgver.tar.gz"
        "handle-equals-signs.patch"
        "fix-undef-behaviour.patch"
        "reproducible-manpage.patch"
        )

prepare()
{
  cd "$srcdir/$pkgname-$pkgver"
  patch -p1 -i $srcdir/handle-equals-signs.patch
  patch -p1 -i $srcdir/fix-undef-behaviour.patch
  patch -p1 -i $srcdir/reproducible-manpage.patch
}


package()
{
 cd "$srcdir/$pkgname-$pkgver"

 make PREFIX="$pkgdir" install
}

sha256sums=('b474e49c6c962754063b3be97a757a2ba9e7a455f0aea612863bf67e9b8b8ea7'
            '54728aa4e244d3662c65ba91fb486dc1d5c64d9d55745ee334c4131109dc233c'
            'ceaf41f7cc9cea5a6fc4b0385ffef10d1ab8812acd2a5b16dcd8d7bca7120488'
            'd854c999a70ec8ac3e32419ece6acd62ad5517a7521a00dc1e5c79e9495c9af2')
