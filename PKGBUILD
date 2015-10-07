# Maintainer: Andrew Chen <andrew.chuanye.chen@gmail.com>

pkgname=sourcery-codebench-mips-linux-gnu
pkgver=2015.05_18
pkgrel=1
pkgdesc='Sourcery CodeBench Lite 2015.05-18 for MIPS GNU/Linux'
url='https://www.mentor.com/embedded-software/sourcery-tools/sourcery-codebench/editions/lite-edition/mips-gnu-linux'
arch=('i686' 'x86_64')
license=('GPL')
source=("https://sourcery.mentor.com/GNUToolchain/package13838/public/mips-linux-gnu/mips-${pkgver//_/-}-mips-linux-gnu-i686-pc-linux-gnu.tar.bz2")
md5sums=('0fcdc0fee260c7bed060c999bfe8440d')

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
