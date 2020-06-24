# Maintainer: Nissar Chababy <funilrys at outlook dot com>
# Ex-Maintainer: Celestial Walrus <aur@celestial.cf>

pkgname=cava
pkgver=0.7.1
pkgrel=1
pkgdesc='Console-based Audio Visualizer for Alsa'
arch=('any')
url='https://github.com/karlstav/cava'
license=('MIT')
depends=('fftw' 'alsa-lib' 'ncurses' 'iniparser')
optdepends=('sndio' 'pulseaudio')
makedepends=('autoconf' 'automake')
source=("https://github.com/karlstav/cava/archive/${pkgver}.tar.gz")
sha512sums=('4f0bd4fb9ca7380c2fa4db3467a4abb70c0d1ba731b901d340b3ee52433bbfeb2ed01305a7b5cfa3ab188334c3109e0e2353feea541e913c2435a96575aa0319')

build() {
  cd ${pkgname}-${pkgver}
  ./autogen.sh
  ./configure --prefix=/usr
  make
}

package() {
  cd ${pkgname}-${pkgver}
  install -Dm755 cava "$pkgdir/usr/bin/cava"
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/"${pkgname}"/LICENSE
}
