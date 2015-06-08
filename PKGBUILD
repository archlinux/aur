# Maintainer: Joermungand <joermungand at gmail dot com>
pkgname=carla-bridges-win
pkgver=2.0beta4
pkgrel=1
pkgdesc="Carla windows bridges"
arch=('i686' 'x86_64')
url="http://kxstudio.sf.net/carla"
license=('GPL2')
conflicts=('carla-bridges-win32' 'carla-bridges-win64')
provides=('carla-bridges-win')
depends=('wine' 'carla-git')
if [[ $CARCH == 'i686' ]]; then
   source+=("${pkgname}::http://downloads.sourceforge.net/project/kxstudio/Releases/carla/Carla-2.0beta4-linux32.tar.xz")
   md5sums+=('09f16a1ab032f036dfff3ce400d74364')
elif [[ $CARCH == 'x86_64' ]]; then
   source+=("${pkgname}::http://downloads.sourceforge.net/project/kxstudio/Releases/carla/Carla-2.0beta4-linux64.tar.xz")
   md5sums+=('091412b61fdc649ac522871b8836e37d')
fi

prepare() {
cd "$srcdir"
  mv Carla* "$pkgname-$pkgver"
}

package() {
  cd "$srcdir/$pkgname-$pkgver/carla.lv2"
  mkdir -p "$pkgdir/usr/lib/carla"
  cp *.exe "$pkgdir/usr/lib/carla/"
  cp *.dll "$pkgdir/usr/lib/carla/"
}

