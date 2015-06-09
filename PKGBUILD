# Maintainer: Emmanuel Gil Peyrot <linkmauve@linkmauve.fr>
# Contributor: Christoph Zeiler <rabyte@gmail.com>

pkgname=onscripter
pkgver=20150208
pkgrel=1
pkgdesc="A game engine compatible to NScripter, to create and perform visual novel games"
arch=('i686' 'x86_64')
url="http://onscripter.sourceforge.jp/onscripter.html"
license=('GPL')
depends=('bzip2' 'sdl_image' 'sdl_mixer' 'sdl_ttf')
source=("http://onscripter.sourceforge.jp/$pkgname-$pkgver.tar.gz"
        'Makefile')
md5sums=('5b4278c1826c2f9b91052e3238b31c8b'
         '325952c28bf369c5c21c330fabaa86c7')

build() {
  cd "$pkgname-$pkgver"
  ln -s "$srcdir/Makefile" .
  make
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 onscripter "$pkgdir/usr/bin/onscripter"
}
