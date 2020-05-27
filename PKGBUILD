# Maintainer: Nissar Chababy <funilrys at outlook dot com>
# Ex-Maintainer: Celestial Walrus <aur@celestial.cf>

pkgname=cava
pkgver=0.7.0
pkgrel=2
pkgdesc='Console-based Audio Visualizer for Alsa'
arch=('any')
url='https://github.com/karlstav/cava'
license=('MIT')
depends=('fftw' 'alsa-lib' 'ncurses' 'iniparser')
optdepends=('sndio')
source=("https://github.com/karlstav/cava/archive/$pkgver.tar.gz")
sha512sums=('e7693ce6e571cc0aea789fd5b9b04c1f123678ddcd21e1e3e2d90133eb67634c0813f9b35cf3db9a87786c9cf61a5c3fd6a104a20e0bf5ed1b9a71797429b984')

build() {
  cd $pkgname-$pkgver
  ./autogen.sh
  ./configure --prefix=/usr
  make
}

package() {
  cd $pkgname-$pkgver
  install -Dm755 cava "$pkgdir/usr/bin/cava"
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/"$pkgname"/LICENSE
}
