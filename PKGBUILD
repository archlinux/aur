# Maintainer: carstene1ns <arch carsten-teibes de> - http://git.io/ctPKG
# Contributor: Alfonso Saaverda "Son Link" <sonlink.dourden@gmail.com>

pkgname=abbaye-des-morts
pkgver=2.0.beta
_hash=558116d5d6618cb4f83d9ead0bdfddcb1f0dff07 # TODO: do a proper release
pkgrel=2
pkgdesc="An obsolete videogame for a dark passage of history"
arch=('i686' 'x86_64')
url=('https://github.com/nevat/abbayedesmorts-gpl')
license=('GPL3')
depends=('sdl2'  'sdl2_image' 'sdl2_mixer')
source=($pkgname-$pkgver.tar.gz::"https://github.com/nevat/abbayedesmorts-gpl/archive/$_hash.tar.gz")
sha256sums=('1abca6d78566a87971f48dc7bc929d7e97da78b51e32e342970eb6def577dfb7')

build(){
  make -C abbayedesmorts-gpl-$_hash
}

package() {
  install -d "$pkgdir"/usr/{bin,share/{applications,pixmaps}}
  make -C abbayedesmorts-gpl-$_hash DESTDIR="$pkgdir/" install
}
