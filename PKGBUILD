# Maintainer: Rod Kay  <rodakay5 at gmail dot com>

pkgname=gnatcoverage-bin
pkgver=26.2
pkgrel=1
pkgdesc='Source and object coverage analysis tool.'

arch=(x86_64)
url='https://github.com/AdaCore/gnatcoverage'
license=(GPL-3.0-only)

provides=(gnatcoverage)
depends=(llvm valgrind)

source=(https://github.com/alire-project/GNAT-FSF-builds/releases/download/gnatcov-$pkgver-1/gnatcov-x86_64-linux-$pkgver-1.tar.gz
        COPYING3)

sha256sums=(6a186a9ba103dbc21957124769a4b51f2ccf87d6af1d81f474496fc480089a48
            c53a65c2fd561c87eaabf1072ef5dcab8653042bc15308465f52413585eb6271)


package()
{
   cd $srcdir/gnatcov-x86_64-linux-$pkgver-1

   cp -r . $pkgdir/usr

   # Install the license.
   #
   install -D -m644    \
      $srcdir/COPYING3 \
      $pkgdir/usr/share/licenses/$pkgname/COPYING3
}
