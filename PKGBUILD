# Maintainer: Michael Straube <michael_straube web de>

pkgname=sdlpop
pkgver=1.16
pkgrel=2
pkgdesc="An open-source port of Prince of Persia"
arch=('i686' 'x86_64')
license=('GPL3')
url="https://github.com/NagyD/SDLPoP"
depends=('sdl2_image' 'sdl2_mixer')
source=("https://github.com/NagyD/SDLPoP/archive/v$pkgver.tar.gz"
        "prince")
sha1sums=('9e6f124705ef3c6e9c66c34046c9d4d5deaffa57'
          '7c558b7d7535fbc174bf4cc2ad9221da73fe2401')

build() {
  cd SDLPoP-$pkgver

  make
}

package() {
  cd SDLPoP-$pkgver

  install -d -m 755 "$pkgdir"/usr/share/{sdlpop,doc/sdlpop}

  install -m 755 prince "$pkgdir/usr/share/sdlpop/"
  install -m 644 SDLPoP.ini *.DAT "$pkgdir/usr/share/sdlpop/"
  install -m 644 doc/* "$pkgdir/usr/share/doc/sdlpop/"
  cp -r data "$pkgdir/usr/share/sdlpop/"

  install -D -m 755 "$srcdir/prince" "$pkgdir/usr/bin/prince"
}
