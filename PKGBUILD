# Maintainer: Nissar Chababy <funilrys at outlook dot com>
# Ex-Maintainer: Celestial Walrus <aur@celestial.cf>

pkgname=cava
pkgver=0.6.0
pkgrel=1
pkgdesc='Console-based Audio Visualizer for Alsa'
arch=('any')
url='https://github.com/karlstav/cava'
license=('MIT')
depends=('fftw' 'alsa-lib' 'ncurses' 'iniparser' 'pulseaudio')
source=("https://github.com/karlstav/cava/archive/$pkgver.tar.gz")
sha512sums=('ef6f8d49f587b4f5cd423dd4efc5ead597c11b91ba045cb3151586eefa0a4079918b3cbe4c3dfbdf08c73e38d84cd5bc6f6d3b110a9ad38025dc5715b4c07037')

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
