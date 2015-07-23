# Maintainer: Felix Yan <felixonmars@gmail.com>
pkgname=vamp-aubio-plugins
pkgver=0.4.0
_downloadid=622
pkgrel=1
pkgdesc="Onset detection, pitch tracking, note tracking and tempo tracking plugins using Paul Brossier's aubio library"
arch=("i686" "x86_64")
url="https://code.soundsoftware.ac.uk/projects/vamp-aubio-plugins"
license=("GPL2")
depends=("vamp-plugin-sdk" "aubio")
source=("https://code.soundsoftware.ac.uk/attachments/download/$_downloadid/$pkgname-$pkgver.tar.gz")

build() {
  cd "$srcdir/$pkgname-$pkgver"
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  install -Dm755 vamp-aubio.so "$pkgdir/usr/lib/vamp/vamp-aubio.so"
}

# vim:set ts=2 sw=2 et:
md5sums=('f4ebb07b0547c5462043aab422b82291')
