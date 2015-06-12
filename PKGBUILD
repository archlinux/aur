# Contributor: jose <jose1711 [at] gmail (dot) com>

pkgname=antigravitaattori
arch=('i686')
pkgver=0.0.3
pkgrel=3
pkgdesc="a multiplayer flying saucer racing game"
license=('GPL-2')
url="http://luolamies.org/software/antigrav/"
depends=('libpng' 'sdl' 'mesa' 'freealut')
source=("http://luolamies.org/software/antigrav/antigrav-${pkgver}.tar.gz" "antigrav.desktop")
md5sums=('20e357bacdff1a04da399c9a5b983ff0' '2fe08f941d366e2cc0a993ea0d0445eb')

build() {
cd $srcdir/antigrav-$pkgver
./configure --prefix=/usr
make || return 1
make exec_prefix=$pkgdir prefix=$pkgdir/usr install
install -D -m644 $srcdir/antigrav.desktop $pkgdir/usr/share/applications/antigrav.desktop || return 1
}
