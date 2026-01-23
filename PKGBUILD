# Maintainer: artist for Artix Linux

pkgname=basu
pkgver=0.2.1
pkgrel=1.1
pkgdesc="The sd-bus library, extracted from systemd. PKGBUILD taken from Artix's repo."
url="https://git.sr.ht/~emersion/basu"
license=('LGPL-2.1-or-later')
arch=('x86_64')
makedepends=('meson' 'gperf')
depends=('glibc' 'gcc-libs' 'libcap')
source=("${url}/refs/download/v${pkgver}/basu-${pkgver}.tar.gz")
sha256sums=('d9b373a9fcb5d5eb5f6c1c56355f76edb7f2f52bc744570e80604e83455a19bd')

build() {
  arch-meson "${pkgname}-${pkgver}" build
  meson compile -C build
}

check() {
  meson test -C build
}

package() {
  DESTDIR="$pkgdir" meson install -C build
}
