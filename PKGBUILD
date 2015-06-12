# Maintainer: jose <jose1711 [at] gmail (dot) com>

pkgname=andyetitmoves-demo
pkgver=1.2.2
pkgrel=1
pkgdesc="physics-based platform game (demo)"
arch=('i686' 'x86_64')
url="http://www.andyetitmoves.net/"
license=("custom:shareware")
source=("andyetitmovesdemo.desktop")
depends=("mesa" "libxft" "sdl_image" "libtheora" "libvorbis" "openal" "libpng12")
md5sums=('32794af11a18207c0fc1ce5fbd26e30c')
options=('!strip')

[ "$CARCH" = "i686" ] && source=(${source[@]} "http://www.andyetitmoves.net/demo/andyetitmovesDemo-"$pkgver"_i386.tar.gz")
[ "$CARCH" = "x86_64" ] && source=(${source[@]} "http://www.andyetitmoves.net/demo/andyetitmovesDemo-"$pkgver"_x86_64.tar.gz") 
[ "$CARCH" = "i686" ] && md5sums=(${md5sums[@]} '93176476d2be3065d2f1fa3b79852702')
[ "$CARCH" = "x86_64" ] && md5sums=(${md5sums[@]} '47ab38352a95f79d84446dc78aaa7e76')

build() {
true
}

package() {
  cd $srcdir/AndYetItMovesDemo
  mkdir -p $pkgdir/usr/{share/AndYetItMovesDemo,bin}
  /bin/tar cf - * | ( cd ../../pkg/usr/share/AndYetItMovesDemo/; tar xfp - )
  ln -s /usr/share/AndYetItMovesDemo/AndYetItMovesDemo $pkgdir/usr/bin/AndYetItMovesDemo
  install -D -m644 icons/48x48.png $pkgdir/usr/share/pixmaps/andyetitmovesdemo.png
  install -D -m644 $srcdir/andyetitmovesdemo.desktop $pkgdir/usr/share/applications/andyetitmovesdemo.desktop
}
