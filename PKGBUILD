# Maintainer: Damian Höster <damian.hoester@posteo.de>

_pkgname=mrdocs
pkgname=$_pkgname-bin
pkgver=0.8.0
pkgrel=1
pkgdesc='C++ documentation generator'
arch=(x86_64)
url=https://www.mrdocs.com
license=('Apache-2.0 WITH LLVM-exception')
options=(staticlibs)
provides=($_pkgname)
conflicts=($_pkgname)
source=(
  $pkgname-$pkgver.tar.xz::https://github.com/cppalliance/$_pkgname/releases/download/v$pkgver/MrDocs-$pkgver-Linux.tar.xz
  LICENSE-$pkgver.txt::https://raw.githubusercontent.com/cppalliance/$_pkgname/v$pkgver/LICENSE.txt
)
sha256sums=(
  75f5b703e2230d7574eecc1640d16de668bd6aeb11713296e748d3378bb509f2
  8d85c1057d742e597985c7d4e6320b015a9139385cff4cbae06ffc0ebe89afee
)

package() {
  cd MrDocs-$pkgver-Linux
  install -dm755 "$pkgdir"/usr
  cp -ra bin include lib share "$pkgdir"/usr/

  install -Dm644 "$srcdir"/LICENSE-$pkgver.txt \
    "$pkgdir"/usr/share/licenses/$pkgname/LICENSE.txt
}
