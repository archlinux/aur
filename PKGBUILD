# Maintainer: Celestial Walrus <aur@celestial.cf>

pkgname=cava
pkgver=0.3.3
pkgrel=1
pkgdesc='Console-based Audio Visualizer for Alsa'
arch=(i686 x86_64)
url='https://github.com/karlstav/cava'
license=(MIT)
depends=(fftw alsa-lib)
source=(https://codeload.github.com/karlstav/cava/tar.gz/${pkgver})
sha1sums=('2cc455e2897d705a538449366d88a4709aaee925')

build() {
  cd $pkgname-$pkgver
  make VERSION="${pkgver}"
}

package() {
  cd $pkgname-$pkgver
  install -Dm755 cava "$pkgdir/usr/bin/cava"
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/"$pkgname"/LICENSE
}
