# Maintainer:  Andrew O'Neill <andrew at meanjollies dot com>
# Contributor: Teteros <teteros -at- openmailbox -dot- org>

_pkgname=Soundpipe
pkgname=soundpipe
pkgver=1.7.0
pkgrel=1
pkgdesc="A lightweight music DSP library"
arch=('x86_64')
url="http://paulbatchelor.github.io/proj/soundpipe.html"
license=('MIT')
makedepends=('libsndfile')
source=(https://github.com/PaulBatchelor/$pkgname/archive/v$pkgver.tar.gz)
sha256sums=('2d6f6b155ad93d12f59ae30e2b0f95dceed27e0723147991da6defc6d65eadda')

build() {
  cd $_pkgname-$pkgver

  make
}

package() {
  cd $_pkgname-$pkgver

  PREFIX=$pkgdir/usr make install -e
  install -Dm644 LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
  mkdir -p $pkgdir/usr/share/doc/$pkgname
  cp -rp examples $pkgdir/usr/share/doc/$pkgname
}
