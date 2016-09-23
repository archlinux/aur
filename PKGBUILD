# Maintainer: carstene1ns <arch carsten-teibes de> - http://git.io/ctPKG
# Contributor: Alfonso Saaverda "Son Link" <sonlink.dourden@gmail.com>

pkgname=abbaye-des-morts
pkgver=2.0.1
pkgrel=1
pkgdesc="An obsolete videogame for a dark passage of history"
arch=('i686' 'x86_64')
url="https://github.com/nevat/abbayedesmorts-gpl"
license=('GPL3')
depends=('sdl2'  'sdl2_image' 'sdl2_mixer')
source=($pkgname-$pkgver.tar.gz::"https://github.com/nevat/abbayedesmorts-gpl/archive/v$pkgver.tar.gz")
sha256sums=('836fe46086610ee5543fe173ae1eb2c272960496cdf27d4f6be108832158c7a8')

build(){
  make -C abbayedesmorts-gpl-$pkgver
}

package() {
  install -d "$pkgdir"/usr/{bin,share/{applications,pixmaps}}
  make -C abbayedesmorts-gpl-$pkgver DESTDIR="$pkgdir/" install
}
