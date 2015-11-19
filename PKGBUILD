# Maintainer: Celestial Walrus <aur@celestial.cf>

pkgname=cava
pkgver=0.3.5
pkgrel=1
pkgdesc='Console-based Audio Visualizer for Alsa'
arch=(i686 x86_64)
url='https://github.com/karlstav/cava'
license=(MIT)
depends=(fftw alsa-lib)
source=(https://codeload.github.com/karlstav/cava/tar.gz/${pkgver})
sha1sums=('19b3a69e9e3a40d5112897cf94bd5e4649ce41f9')

build() {
  cd $pkgname-$pkgver
  sed -i -e 's/ncursesw5-config/ncursesw6-config/' makefile
  make VERSION="${pkgver}"
}

package() {
  cd $pkgname-$pkgver
  install -Dm755 cava "$pkgdir/usr/bin/cava"
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/"$pkgname"/LICENSE
}
