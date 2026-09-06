# Maintainer: Damian Höster <damian.hoester@posteo.de>

_pkgname=mrdocs
pkgname=$_pkgname-bin
pkgver=2026.9.4
pkgrel=1
pkgdesc='C++ documentation generator'
arch=(x86_64)
url=https://www.mrdocs.com
license=('Apache-2.0 WITH LLVM-exception')
provides=($_pkgname)
conflicts=($_pkgname)
source=(
  $pkgname-$pkgver.tar.xz::https://github.com/cppalliance/$_pkgname/releases/download/$pkgver/MrDocs-$pkgver-Linux.tar.xz
  LICENSE-$pkgver.txt::https://raw.githubusercontent.com/cppalliance/$_pkgname/$pkgver/LICENSE.txt
)
sha256sums=(
  1e0a455d3e68cb0bacc0884b10fbdf9865b260ae76ce46003c5542e2489af769
  8d85c1057d742e597985c7d4e6320b015a9139385cff4cbae06ffc0ebe89afee
)

package() {
  cd MrDocs-0.8.0-Linux  # wrong version in path, upstream issue
  install -dm755 "$pkgdir"/usr
  cp -ra bin include lib share "$pkgdir"/usr/

  install -Dm644 "$srcdir"/LICENSE-$pkgver.txt \
    "$pkgdir"/usr/share/licenses/$pkgname/LICENSE.txt
}
