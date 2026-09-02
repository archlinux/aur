pkgname=skwd-lens-model
pkgver=1.0.0
pkgrel=1
pkgdesc='Default SigLIP 2 semantic model pack for Skwd Lens'
arch=(x86_64)
url='https://github.com/liixini/skwd-lens'
license=(Apache-2.0 CC-BY-4.0 MIT)
depends=(gcc-libs glibc)
options=(!strip !debug)
source=("skwd-lens-model-1.0.0-1.fc44.src.rpm::https://download.copr.fedorainfracloud.org/results/piixini/skwd-wall-v2/srpm-builds/10933293/skwd-lens-model-1.0.0-1.fc44.src.rpm")
sha256sums=('0d4da8b8432a5b1ff68ec2840b1f232a4d2707eb487e424a50ef518d7ab32490')

prepare() {
  bsdtar -xf "$srcdir/skwd-lens-model-1.0.0-1.fc44.src.rpm" -C "$srcdir"
  bsdtar -xf "$srcdir/skwd-lens-model-1.0.0.tar.xz" -C "$srcdir"
}

package() {
  install -d "$pkgdir/usr/share/skwd-lens/models"
  cp -a "$srcdir/$pkgname-$pkgver/semantic" "$pkgdir/usr/share/skwd-lens/models/semantic"
  install -d "$pkgdir/usr/share/licenses/$pkgname"
  install -m644 "$srcdir/$pkgname-$pkgver/licenses/"*.txt \
    "$pkgdir/usr/share/licenses/$pkgname/"
}
