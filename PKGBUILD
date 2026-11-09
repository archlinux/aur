# Maintainer: bobo <https://aur.archlinux.org/account/bobosingle>

pkgname=manis-pocket-bin
pkgver=0.1.0.r1146.g0cbea45
pkgrel=1
pkgdesc='Manis Pocket GTK4 clipboard manager and Wayland sync client'
arch=('x86_64')
url='https://github.com/kaigedong/Manis-Pocket'
license=('MIT')
# wl-copy and wl-paste are executed at runtime, so namcap cannot detect this dependency.
depends=('glibc' 'libgcc' 'gtk4' 'wl-clipboard')
provides=("manis-pocket-wayland=${pkgver}")
conflicts=('manis-pocket-wayland' 'manis-pocket-wayland-git')
options=('!debug' '!strip')
_upstream_pkgrel=1
source_x86_64=(
  "manis-pocket-wayland-${pkgver}-${_upstream_pkgrel}-${CARCH}.pkg.tar.zst::https://github.com/kaigedong/Manis-Pocket/releases/download/wayland-${pkgver}/manis-pocket-wayland-${pkgver}-${_upstream_pkgrel}-${CARCH}.pkg.tar.zst"
)
sha256sums_x86_64=('6617c84ae5c3f228dc488e8eebb24a3281655ac2a71645c2f619a6b0c2e4565c')

package() {
  install -Dm755 "$srcdir/usr/bin/manis-pocket" \
    "$pkgdir/usr/bin/manis-pocket"
  install -Dm755 "$srcdir/usr/bin/manis-pocket-wayland" \
    "$pkgdir/usr/bin/manis-pocket-wayland"
  install -Dm644 "$srcdir/usr/share/applications/io.github.kaigedong.ManisPocket.desktop" \
    "$pkgdir/usr/share/applications/io.github.kaigedong.ManisPocket.desktop"
  install -Dm644 "$srcdir/usr/share/icons/hicolor/256x256/apps/io.github.kaigedong.ManisPocket.png" \
    "$pkgdir/usr/share/icons/hicolor/256x256/apps/io.github.kaigedong.ManisPocket.png"
  install -Dm644 "$srcdir/usr/share/licenses/manis-pocket-wayland/LICENSE" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
