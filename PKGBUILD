# Maintainer:  Andrew O'Neill <andrew at meanjollies dot com>
# Contributor: Teteros <teteros -at- openmailbox -dot- org>

_pkgname=Soundpipe
pkgname=soundpipe
pkgver=1.6.0
pkgrel=1
pkgdesc="A lightweight music DSP library"
arch=('x86_64')
url="http://paulbatchelor.github.io/proj/soundpipe.html"
license=('MIT')
makedepends=('libsndfile')
source=(https://github.com/PaulBatchelor/$pkgname/archive/v$pkgver.tar.gz)
sha256sums=('107a890a87005a8bb1859e91a2f9eeb1b14ab489f86f8b2b42002db81bde04b2')

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
