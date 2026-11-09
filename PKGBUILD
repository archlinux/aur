# Maintainer: kryptic.sh <hello at kryptic dot sh>
#
# Auto-generated. Source: https://github.com/kryptic-sh/crcbl
# Edits made directly to the AUR repo will be overwritten on the next
# release. To change this PKGBUILD, edit `pkg/aur/PKGBUILD-bin.in` in
# the upstream repo and let `.github/workflows/ci.yml` republish.
pkgname=crcbl-bin
_pkgname=crcbl
pkgver=0.18.0
pkgrel=1
pkgdesc="Crucible engine's headless control CLI (binary release)"
arch=('x86_64' 'aarch64')
url="https://github.com/kryptic-sh/crcbl"
license=('MIT')
# The binary links ALSA through cpal; Vulkan and the display servers are
# opened at run time and are not dependencies.
depends=('alsa-lib' 'gcc-libs' 'glibc')
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname")

source_x86_64=("crcbl-v${pkgver}-x86_64-unknown-linux-gnu.tar.gz::https://github.com/kryptic-sh/crcbl/releases/download/v${pkgver}/crcbl-v${pkgver}-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("crcbl-v${pkgver}-aarch64-unknown-linux-gnu.tar.gz::https://github.com/kryptic-sh/crcbl/releases/download/v${pkgver}/crcbl-v${pkgver}-aarch64-unknown-linux-gnu.tar.gz")
sha256sums_x86_64=('976af9d144c16820999613a83f5680e5b1e902db13d3a5343c2c89ec51b6692f')
sha256sums_aarch64=('07c58922d0f10cf29f2f9850944233a1280e5431f9707e8f3dd9eee5616cad1b')

package() {
    install -Dm755 "$srcdir/crcbl" "$pkgdir/usr/bin/crcbl"
    install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 "$srcdir/README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
}
