# Maintainer: Michael Straube <straubem@gmx.de>

pkgname=sdlpop
pkgver=1.16
pkgrel=5
pkgdesc="An open-source port of Prince of Persia"
arch=('i686' 'x86_64')
license=('GPL3')
url="https://github.com/NagyD/SDLPoP"
depends=('sdl2_image' 'sdl2_mixer')
source=("https://github.com/NagyD/SDLPoP/archive/v$pkgver.tar.gz"
        "prince")
sha1sums=('9e6f124705ef3c6e9c66c34046c9d4d5deaffa57'
          '79acf33eab835f1eba0f3c4d76055d68155a6254')

build() {
  cd SDLPoP-$pkgver

  make
}

package() {
  cd SDLPoP-$pkgver

  install -d "$pkgdir"/usr/{lib/sdlpop,share/sdlpop}

  install -m 755 prince "$pkgdir"/usr/lib/sdlpop
  install -m 644 SDLPoP.ini *.DAT "$pkgdir"/usr/share/sdlpop
  cp -r data doc "$pkgdir"/usr/share/sdlpop

  install -D -m 755 ../prince "$pkgdir"/usr/bin/prince
}
