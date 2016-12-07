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
sha256sums=('4198eecdb2c4fed8f609af810962c943572df83da99c571146cee1596e7ee55b'
            '4673b27ab68c2fa8babf7a5b5fa3bd42012a05e5e8e190fe29d93873445beb18')

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
