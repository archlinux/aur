# Contributor: Kyle Keen <keenerd@gmail.com>
pkgname=spheres-of-chaos
pkgver=2.0.7
pkgrel=2
pkgdesc="Asteroids, while dropping acid."
url="http://www.spheresofchaos.com/"
_watch="http://www.spheresofchaos.com/p/download.php"
arch=('i686' 'x86_64')
license=("custom:freeware")
depends=('sdl')
source=(http://www.spheresofchaos.com/files/chaosl.zip chaosl)
md5sums=('ec067bc2373c055f42884d35e35d9b40'
         'bef16e8ff1c7a3c226b698c932ece5f2')

case $CARCH in
    x86_64)
        depends=('lib32-sdl')
        ;;
esac

build() {
  cd "$srcdir"
  sed -i 's/sphchaos/.spchaos/' Chaosl
}

package() {
  install -D -m755 Chaosl   "$pkgdir/usr/bin/chaosl.bin"
  install -D -m755 chaosl   "$pkgdir/usr/bin/chaosl"
}
