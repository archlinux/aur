# Maintainer: bobo <https://aur.archlinux.org/account/bobosingle>

pkgname=manis-pocket-bin
pkgver=2.7.134
pkgrel=1
pkgdesc='Manis Pocket clipboard manager and P2P sync client (GPUI)'
arch=('x86_64')
url='https://github.com/kaigedong/Manis-Pocket'
license=('MIT')
# wl-copy and wl-paste are executed at runtime, so namcap cannot detect this dependency.
depends=('glibc' 'libgcc' 'wl-clipboard' 'wayland' 'libxkbcommon' 'libxkbcommon-x11' 'libxcb' 'freetype2' 'fontconfig' 'vulkan-icd-loader')
provides=("manis-pocket=${pkgver}")
conflicts=('manis-pocket' 'manis-pocket-wayland' 'manis-pocket-wayland-git')
options=('!debug' '!strip')
_upstream_pkgrel=1
source_x86_64=(
  "manis-pocket-${pkgver}-${_upstream_pkgrel}-${CARCH}.pkg.tar.zst::https://github.com/kaigedong/Manis-Pocket/releases/download/build-2.7.134/manis-pocket-${pkgver}-${_upstream_pkgrel}-${CARCH}.pkg.tar.zst"
)
sha256sums_x86_64=('78f3bcebabc9e622a472ad5374651613dfa7eccaf8f86419b72d96549fc105ce')

package() {
  install -Dm755 "$srcdir/usr/bin/manis-pocket" \
    "$pkgdir/usr/bin/manis-pocket"
  install -Dm644 "$srcdir/usr/share/applications/io.github.kaigedong.ManisPocket.desktop" \
    "$pkgdir/usr/share/applications/io.github.kaigedong.ManisPocket.desktop"
  install -Dm644 "$srcdir/usr/share/icons/hicolor/256x256/apps/io.github.kaigedong.ManisPocket.png" \
    "$pkgdir/usr/share/icons/hicolor/256x256/apps/io.github.kaigedong.ManisPocket.png"
  install -Dm644 "$srcdir/usr/share/licenses/manis-pocket/LICENSE" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
