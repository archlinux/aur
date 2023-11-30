# Maintainer: ZAvrikDinozavrik <zaz965@stm32f0.ru>
pkgname=sonycardscanner
pkgver=0.0.1.7
pkgrel=1
pkgdesc="Утилита для работы с камерами Sony"
arch=('x86_64')
url="https://git.alexavr.ru/ZAvrikDinozavrik/SonyCardScanner"
license=('GPL3')
depends=('qt5-base' 'libraw' 'opencv')
source=("sonycardscanner-$pkgver-linux.tar.gz::https://git.alexavr.ru/ZAvrikDinozavrik/SonyCardScanner/archive/v$pkgver.tar.gz")
b2sums=('SKIP')

build() {
    cd $srcdir/sonycardscanner
    qmake
    make
}

package() {
    cd $srcdir/sonycardscanner
    make INSTALL_ROOT="$pkgdir" install
}
