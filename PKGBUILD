# Maintainer: Joermungand <joermungand at gmail dot com>
pkgname=carla-bridges-win
pkgver=2.0beta5.1
pkgrel=1
pkgdesc="Carla windows bridges"
arch=('i686' 'x86_64')
url="http://kxstudio.sf.net/carla"
license=('GPL2')
conflicts=('carla-bridges-win32' 'carla-bridges-win64')
provides=('carla-bridges-win')
depends=('wine' 'carla-git')
if [[ $CARCH == 'i686' ]]; then
   source+=("${pkgname}::https://github.com/falkTX/Carla/releases/download/1.9.7/Carla-2.0beta5.1-linux32.tar.xz")
   md5sums+=('8dd11480171693cfd47b209d25b6cdee')
elif [[ $CARCH == 'x86_64' ]]; then
   source+=("${pkgname}::https://github.com/falkTX/Carla/releases/download/1.9.7/Carla-2.0beta5.1-linux64.tar.xz")
   md5sums+=('242de9ef989dbdebfebb7f28c144449b')
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

