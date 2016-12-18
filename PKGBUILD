# Maintainer: LinuxUser <theo.smit@gmx.com>

pkgname=pouetchess_bin
pkgver=0.2.0
pkgrel=2
pkgdesc="A simple but nice 3D chess game"
arch=('i686' 'x86_64')
url="http://pouetchess.sourceforge.net/"
license=('GPL')

depends_i686=('mesa' 'mesa-libgl' 'glu' 'sdl' 'sdl_image')
depends_x86_64=('lib32-mesa' 'lib32-mesa-libgl' 'lib32-glu' 'lib32-sdl' 'lib32-sdl_image')

source=("https://sourceforge.net/projects/pouetchess/files/pouetchess/0.2/pouetchess_bin_0.2.0.tar.gz"
        "pouetchess"
        "pouetchess.desktop" )

md5sums=('14c5e1f191eaad71e1dc2f643d90bd3e'
         'b1f6cb4212ac6d8c89a0bba8f69f6a42'
         'f8f0394c67e5832ce92a9d9c6862c91e')

package() {
    cd "$srcdir/${pkgname}_$pkgver"
    mkdir -p $pkgdir/usr/share/pouetchess
    cp -r . $pkgdir/usr/share/pouetchess/
    mkdir -p $pkgdir/usr/bin
    install -m755 $srcdir/pouetchess $pkgdir/usr/bin/pouetchess
    chmod 755 $pkgdir/usr/bin/pouetchess
    mkdir -p $pkgdir/usr/share/pixmaps
    install -m644 $srcdir/${pkgname}_$pkgver/data/icons/pouetChess.png $pkgdir/usr/share/pixmaps/
    mkdir -p $pkgdir/usr/share/applications
    install -m644 $srcdir/pouetchess.desktop $pkgdir/usr/share/applications/
}
