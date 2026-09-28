# Maintainer: bobo <https://aur.archlinux.org/account/bobosingle>

pkgname=manis-pocket-bin
pkgver=0.1.0.r1134.g65c50ae
pkgrel=1
pkgdesc='Wayland clipboard sync client for Manis Pocket'
arch=('x86_64')
url='https://github.com/kaigedong/Manis-Pocket'
license=('MIT')
# wl-copy and wl-paste are executed at runtime, so namcap cannot detect this dependency.
depends=('glibc' 'libgcc' 'wl-clipboard')
provides=("manis-pocket-wayland=${pkgver}")
conflicts=('manis-pocket-wayland' 'manis-pocket-wayland-git')
options=('!debug' '!strip')
_upstream_pkgrel=1
source_x86_64=(
  "manis-pocket-wayland-${pkgver}-${_upstream_pkgrel}-${CARCH}.pkg.tar.zst::https://github.com/kaigedong/Manis-Pocket/releases/download/wayland-${pkgver}/manis-pocket-wayland-${pkgver}-${_upstream_pkgrel}-${CARCH}.pkg.tar.zst"
)
sha256sums_x86_64=('9465563e39e9a03f5ef6d89fb0ac09a32990e35aadd405cb82d8c21c16e6a19c')

package() {
  install -Dm755 "$srcdir/usr/bin/manis-pocket-wayland" \
    "$pkgdir/usr/bin/manis-pocket-wayland"
  install -Dm644 "$srcdir/usr/share/licenses/manis-pocket-wayland/LICENSE" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
