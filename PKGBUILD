# Maintainer: ImAli <alsajadali12@gmail.com>

pkgname=sourcery-codebench-arm-none-eabi
pkgver=2014.05
_pkgnum=29
pkgrel=1
pkgdesc="Sourcery CodeBench Lite for ARM NONE EABI"
arch=('i686' 'x86_64')
url="http://www.mentor.com/embedded-software/sourcery-tools/sourcery-codebench/editions/lite-edition/"
license=('custom')
options=(!strip)
source=("http://sourcery.mentor.com/public/gnu_toolchain/arm-none-linux-gnueabi/arm-$pkgver-$_pkgnum-arm-none-eabi-i686-pc-linux-gnu.tar.bz2")
md5sums=("02fc7078af9c9c7e792f026c772374ae")

if test "$CARCH" == x86_64; then
  depends=(lib32-glibc)
fi

package() {
	cd $srcdir/arm-*
	mkdir -p $pkgdir/usr
	cp -a * $pkgdir/usr
	mkdir -p $pkgdir/usr/share/licenses/arm-none-eabi
	cp share/doc/arm-none-eabi/LICENSE.txt $pkgdir/usr/share/licenses/arm-none-eabi
}
