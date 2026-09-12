pkgname=skwd-lens-model
pkgver=1.0.0
pkgrel=1
pkgdesc='Default SigLIP 2 semantic model pack for Skwd Lens'
arch=(x86_64)
url='https://github.com/liixini/skwd-lens'
license=(Apache-2.0 CC-BY-4.0 MIT)
depends=(gcc-libs glibc)
options=(!strip !debug)
source=("skwd-lens-model-1.0.0-1.fc44.src.rpm::https://download.copr.fedorainfracloud.org/results/piixini/skwd-wall-v2/srpm-builds/10980056/skwd-lens-model-1.0.0-1.fc44.src.rpm")
sha256sums=('c3d8eaa5890ff05bdfa8ec4e0323deeee73f9273cb6d5dd6bf1b07a0b6893f07')

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
