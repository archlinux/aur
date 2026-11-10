# Maintainer: bobo <https://aur.archlinux.org/account/bobosingle>

pkgname=manis-pocket-bin
pkgver=2.7.122
pkgrel=1
pkgdesc='Manis Pocket GTK4 clipboard manager and Wayland sync client'
arch=('x86_64')
url='https://github.com/kaigedong/Manis-Pocket'
license=('MIT')
# wl-copy and wl-paste are executed at runtime, so namcap cannot detect this dependency.
depends=('glibc' 'libgcc' 'gtk4' 'wl-clipboard')
provides=("manis-pocket=${pkgver}")
conflicts=('manis-pocket' 'manis-pocket-wayland' 'manis-pocket-wayland-git')
options=('!debug' '!strip')
_upstream_pkgrel=1
source_x86_64=(
  "manis-pocket-${pkgver}-${_upstream_pkgrel}-${CARCH}.pkg.tar.zst::https://github.com/kaigedong/Manis-Pocket/releases/download/build-2.7.122/manis-pocket-${pkgver}-${_upstream_pkgrel}-${CARCH}.pkg.tar.zst"
)
sha256sums_x86_64=('79cbd667c035070cccff720a69f83cf6382adf3c264ffa28e71092777c3b2641')

package() {
  install -Dm755 "$srcdir/usr/bin/manis-pocket" \
    "$pkgdir/usr/bin/manis-pocket"
  install -Dm755 "$srcdir/usr/bin/manis-pocket-wayland" \
    "$pkgdir/usr/bin/manis-pocket-wayland"
  install -Dm644 "$srcdir/usr/share/applications/io.github.kaigedong.ManisPocket.desktop" \
    "$pkgdir/usr/share/applications/io.github.kaigedong.ManisPocket.desktop"
  install -Dm644 "$srcdir/usr/share/icons/hicolor/256x256/apps/io.github.kaigedong.ManisPocket.png" \
    "$pkgdir/usr/share/icons/hicolor/256x256/apps/io.github.kaigedong.ManisPocket.png"
  install -Dm644 "$srcdir/usr/share/licenses/manis-pocket/LICENSE" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
