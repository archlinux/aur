# Maintainer: Alexander F. Rødseth <xyproto@archlinux.org>

pkgname=muviz
pkgver=1.0.0
pkgrel=1
pkgdesc='Music visualizer'
arch=(x86_64)
url='https://github.com/xyproto/muviz'
license=(MIT GPL3)
depends=(ffts glfw rapidjson)
makedepends=(cxx git)
source=("git+$url#commit=1b1353eab495b4181505a3e773e5aa58998660ee")
b2sums=(SKIP)

build() {
  cxx -C $pkgname
}

package() {
  DESTDIR="$pkgdir" PREFIX=/usr cxx -C $pkgname install
  install -Dm644 $pkgname/LICENSE \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
