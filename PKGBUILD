#Maintainer: Rod Kay  <rodakay5 at gmail.com>

pkgname=gnatcoverage-bin
pkgver=22.0
pkgrel=1
pkgdesc="Source and object coverage analysis tool"
arch=('i686' 'x86_64')
url="https://github.com/AdaCore/gnatcoverage"
license=('GPL3')
provides=('gnatcoverage')
depends=('llvm' 'valgrind')

source=("https://github.com/alire-project/GNAT-FSF-builds/releases/download/gnatcov-$pkgver-1/gnatcov-x86_64-linux-$pkgver-1.tar.gz")
sha256sums=(eae687f0fb100524933ae37123a1de5ec26e5fca7fe2355cf2b267c9ccc0989a)

package()
{
   cd "$srcdir/gnatcov-x86_64-linux-$pkgver-1"

   ./doinstall $pkgdir/usr

   # Install the license.
   install -D -m644 \
      "COPYING3"    \
      "$pkgdir/usr/share/licenses/$pkgname/COPYING3"
}