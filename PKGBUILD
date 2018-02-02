# Maintainer: Andrew Chen <andrew.chuanye.chen@gmail.com>

pkgname=sourcery-codebench-mips-linux-gnu
pkgver=2016.05_8
pkgrel=1
pkgdesc="Sourcery CodeBench Lite ${pkgver//_/-} for MIPS GNU/Linux"
url='https://sourcery.mentor.com/GNUToolchain/subscription3130?lite=MIPS'
arch=('i686' 'x86_64')
license=('GPL')
source=("https://sourcery.mentor.com/GNUToolchain/package13838/public/mips-linux-gnu/mips-${pkgver//_/-}-mips-linux-gnu-i686-pc-linux-gnu.tar.bz2")
md5sums=('ba4b96ecaa009d3bd8f1103effcde4c2')

if [ "$CHARH" == 'x86_64' ]; then
  depends=(lib32-glibc)
fi

package() {
  cd mips-${pkgver%_*}
  mkdir -p $pkgdir/usr
  cp -a * $pkgdir/usr/
  mkdir -p $pkgdir/usr/share/licenses/mips-linux-gnu
  cp share/doc/mips-mips-linux-gnu/LICENSE.txt $pkgdir/usr/share/licenses/mips-linux-gnu/
}
