pkgname=skwd-drawing-model
pkgver=1.0.0
pkgrel=1
pkgdesc='Default Drawing model pack for Skwd Deck'
arch=(x86_64)
url='https://github.com/liixini/skwd-drawing-model'
license=(Apache-2.0 MIT)
depends=(gcc-libs glibc 'skwd-lens-model>=1.0.0' 'skwd-lens-model<1.1.0' vulkan-icd-loader)
options=(!strip !debug)
source=("$pkgname-$pkgver.tar.xz::https://github.com/liixini/skwd-drawing-model/releases/download/v1.0.0/skwd-drawing-model-1.0.0.tar.xz")
sha256sums=('cf727e371c992b99b0ca1612de584561fa734226c958b396b7fb69dfb81c4aa1')

package() {
  install -d "$pkgdir/usr/share/skwd-deck/models"
  cp -a "$srcdir/$pkgname-$pkgver/drawing" "$pkgdir/usr/share/skwd-deck/models/drawing"
  install -d "$pkgdir/usr/share/licenses/$pkgname"
  install -m644 "$srcdir/$pkgname-$pkgver/licenses/"* \
    "$pkgdir/usr/share/licenses/$pkgname/"
}
