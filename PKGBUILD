# Maintainer: kryptic.sh <hello at kryptic dot sh>
#
# Auto-generated. Source: https://github.com/kryptic-sh/pikr
# Edits made directly to the AUR repo will be overwritten on the next
# release. To change this PKGBUILD, edit `pkg/aur/PKGBUILD-bin.in` in
# the upstream repo and let `.github/workflows/ci.yml` republish.
pkgname=pikr-bin
_pkgname=pikr
pkgver=0.9.1
pkgrel=1
pkgdesc="Vim-modal application launcher — rofi replacement. (binary release)"
arch=('x86_64')
url="https://pikr.kryptic.sh/"
license=('MIT')
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname")
# Loaded with dlopen at run time, so namcap cannot see them.
depends=('libxkbcommon' 'wayland' 'vulkan-icd-loader' 'fontconfig')
optdepends=('vulkan-driver: a Vulkan driver for the loader to use (e.g. vulkan-radeon, vulkan-intel, nvidia-utils)'
            'libxcb: the X11 fallback'
            'libxkbcommon-x11: keymaps under the X11 fallback'
            'xcb-util-cursor: themed pointer cursors under the X11 fallback')

# aarch64 source / sha lines will be restored when #31 lands
# `aarch64-unknown-linux-gnu` back in the binary build matrix.
source_x86_64=("pikr-v${pkgver}-x86_64-unknown-linux-gnu.tar.gz::https://github.com/kryptic-sh/pikr/releases/download/v${pkgver}/pikr-v${pkgver}-x86_64-unknown-linux-gnu.tar.gz")
sha256sums_x86_64=('22dcb18d3c5220b1b3c11dd815d6139a02c3395870ae1e22d882e0f04b3157a7')

package() {
    install -Dm755 "$srcdir/pikr" "$pkgdir/usr/bin/pikr"
    install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 "$srcdir/README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
}
