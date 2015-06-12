# Maintainer: Jose Riha < jose 1711 gmail com >

pkgname=gpmd85emulator
pkgver=0.9.1402
pkgrel=2
pkgdesc="Multiplatform GNU/GPL Tesla PMD 85 Emulator"
arch=('i686' 'x86_64')
url="http://sourceforge.net/projects/gpmd85emulator/"
license=('GPL')
depends=('gcc-libs' 'sdl')
source=("http://downloads.sourceforge.net/project/gpmd85emulator/GPMD85emulator.v${pkgver}.tar.gz")
md5sums=('c009d0e3be6ca357c4ce00eda7eb8ad7')

build ()
{
cd $srcdir/GPMD85emu
./configure --prefix=/usr
make
}

package() {
cd $srcdir/GPMD85emu
mkdir -p $pkgdir/usr/share/gpmd85emu
cp -r $srcdir/GPMD85emu/tape $pkgdir/usr/share/gpmd85emu
make DESTDIR=$pkgdir install
}
