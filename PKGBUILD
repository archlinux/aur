# Maintainer: muttleyxd <muttdini[ at ]gmail.com>
pkgname=deplink-bin
pkgver=0.1.0
pkgrel=1
pkgdesc="C/C++ Dependency Manager"
arch=('any')
url="https://github.com/deplink/deplink"
license=('MIT')
depends=('php')
makedepends=('binutils')
provides=('deplink')
conflicts=('deplink')
source=("https://cdn.deplink.org/download/linux/deplink-latest.deb")
sha256sums=('8b2b464ee5745a6453806a44fd6ec01bf5a922c2b37f2bfaecb2f7a5cd912941')

package() 
{
   cd "$srcdir"
   ar p deplink-latest.deb data.tar.xz | tar Jx
   mkdir -p "$pkgdir/usr/bin"
   cp "$srcdir/usr/share/deplink/bin/deplink-latest.phar" "$pkgdir/usr/bin/deplink"
   chmod +x "$pkgdir/usr/bin/deplink"
}
