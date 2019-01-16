# Maintainer: jose <jose1711 [at] gmail (dot) com>

pkgname=antigravitaattori
arch=('i686' 'x86_64')
pkgver=0.0.3
pkgrel=6
pkgdesc="a multiplayer flying saucer racing game"
license=('GPL-2')
url="https://github.com/callaa/antigravitaattori"
depends=('libpng' 'sdl' 'mesa' 'freealut')
source=("https://github.com/callaa/antigravitaattori/archive/master.zip" "antigrav.desktop")
md5sums=('33f83adefa1b2912e655042cd320c20f'
         '2fe08f941d366e2cc0a993ea0d0445eb')

build() {
cd $srcdir/antigravitaattori-master
./configure --prefix=/usr
make
}

package() {
cd $srcdir/antigravitaattori-master
make exec_prefix=$pkgdir/usr prefix=$pkgdir/usr install
install -D -m644 $srcdir/antigrav.desktop $pkgdir/usr/share/applications/antigrav.desktop
}
