# Maintainer: Celestial Walrus <aur@celestial.cf>

pkgname=cava
pkgver=0.4.3
pkgrel=1
pkgdesc='Console-based Audio Visualizer for Alsa'
arch=('any')
url='https://github.com/karlstav/cava'
license=('MIT')
depends=('fftw' 'alsa-lib' 'ncurses' 'iniparser' 'pulseaudio')
source=("https://github.com/karlstav/cava/archive/$pkgver.tar.gz")
sha512sums=('c5f949c2e471cc2d8b927477a19587505c5d0a177fe24998db6c98fc65f9705fc44d8281655cbbd3e1bf4e9e05df0011e32e55fabb554968f11876b9ec0d05b2')

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
