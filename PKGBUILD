# Maintainer: Michał Wojdyła < micwoj9292 at gmail dot com >
# Contributor: Kyle Keen <keenerd@gmail.com>
pkgname=spheres-of-chaos
pkgver=2.0.7
pkgrel=4
pkgdesc="Asteroids, while dropping acid."
url="http://www.spheresofchaos.com/"
_watch="http://www.spheresofchaos.com/p/download.php"
arch=('i686' 'x86_64')
license=("custom:freeware")
depends=('sdl')
depends_x86_64=('lib32-sdl' 'lib32-libpulse')
source=(http://www.spheresofchaos.com/files/chaosl.zip chaosl)
md5sums=('ec067bc2373c055f42884d35e35d9b40'
         'bef16e8ff1c7a3c226b698c932ece5f2')

build() {
  cd "$srcdir"
  sed -i 's/sphchaos/.spchaos/' Chaosl
}

package() {
  install -D -m755 Chaosl   "$pkgdir/usr/bin/chaosl.bin"
  install -D -m755 chaosl   "$pkgdir/usr/bin/chaosl"
}
