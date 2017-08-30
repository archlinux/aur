# Maintainer: Alexander F Rødseth <xyproto@archlinux.org>
# Contributor: Teteros <teteros@openmailbox.org>

pkgname=soundpipe-dev
pkgver=1.5.0
pkgrel=1
pkgdesc='Lightweight music DSP library'
arch=('x86_64' 'i686')
url='http://paulbatchelor.github.io/proj/soundpipe.html'
license=('MIT')
makedepends=('libsndfile' 'git')
source=("git+https://github.com/PaulBatchelor/Soundpipe#commit=3946d5b77f8e2e812b919d547518b896b1439554")
md5sums=('SKIP')

build() {
  make -C Soundpipe
}

package() {
  PREFIX="$pkgdir/usr" make -C Soundpipe install -e
  install -Dm644 Soundpipe/LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:ts=2 sw=2 et:
