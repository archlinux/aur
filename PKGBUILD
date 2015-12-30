# Maintainer: Celestial Walrus <aur@celestial.cf>

pkgname=cava
pkgver=0.4.0
pkgrel=1
pkgdesc='Console-based Audio Visualizer for Alsa'
arch=(i686 x86_64)
url='https://github.com/karlstav/cava'
license=(MIT)
depends=(fftw alsa-lib)
source=(https://codeload.github.com/karlstav/cava/tar.gz/${pkgver})
sha1sums=('ee65ddf3044b0b370341f5d32c5e7718bbf48bd6')

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