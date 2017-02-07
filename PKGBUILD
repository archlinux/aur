# Maintainer: Celestial Walrus <aur@celestial.cf>

pkgname=cava
pkgver=0.4.2
pkgrel=1
pkgdesc='Console-based Audio Visualizer for Alsa'
arch=('any')
url='https://github.com/karlstav/cava'
license=('MIT')
depends=('fftw' 'alsa-lib' 'ncurses' 'iniparser' 'pulseaudio')
source=("https://github.com/karlstav/cava/archive/$pkgver.tar.gz")
sha512sums=('6fec0afd70f0cee5103160df131fab675d37ee2e14fef5780c3348d22b82839cdb57f9878936f4f41c2313d852b9fd6537a462bcf3a8905a3ad39ee3b8531c98')

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
