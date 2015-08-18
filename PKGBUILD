# Maintainer: heinrich5991 <heinrich5991@gmail.com>
pkgname=3dgame-git
pkgver=20150818
pkgrel=1
pkgdesc="A voxel game proof-of-concept"
arch=('x86' 'x86_64')
url="https://github.com/speedy-consoles/3dgamecpp"
license=('none')
depends=('boost-libs'
         'ftgl'
         'glew'
         'glu'
         'libgl'
         'log4cxx'
         'sdl2'
         'sdl2_image')
source=('git://github.com/speedy-consoles/3dgamecpp'
        '3dgame')
sha256sums=('SKIP'
            '7ff10ee8a254e8c69f17e26b73749721d9a81f5081c6163c2ae8dcf5858d2997')

build() {
  cd "$srcdir"/3dgamecpp/
  make DEBUG=0
}

package() {
  cd "$srcdir"/3dgamecpp/
  install -dm755 "$pkgdir"/usr/{lib,share}/3dgame/ "$pkgdir"/usr/bin/

  cp -r *.txt *.conf fonts/ img/ res/ shaders/ "$pkgdir"/usr/share/3dgame/
  install -m755 bin/release/3dgame "$pkgdir"/usr/lib/3dgame/
  install -m755 ../3dgame "$pkgdir"/usr/bin/
}
