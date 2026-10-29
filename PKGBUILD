# Maintainer: kryptic.sh <hello at kryptic dot sh>
#
# Auto-generated. Source: https://github.com/kryptic-sh/crcbl
# Edits made directly to the AUR repo will be overwritten on the next
# release. To change this PKGBUILD, edit `pkg/aur/PKGBUILD-bin.in` in
# the upstream repo and let `.github/workflows/ci.yml` republish.
pkgname=crcbl-bin
_pkgname=crcbl
pkgver=0.13.0
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
sha256sums_x86_64=('b459e92909bd7c2db6f9d298eab82b9d98b526c4e5cc8521965327623aec2351')
sha256sums_aarch64=('1be9d720be7fcbe4996ecbff2c14a8c760f79a39ce8806ec6e954a8cc58f428d')

package() {
    install -Dm755 "$srcdir/crcbl" "$pkgdir/usr/bin/crcbl"
    install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 "$srcdir/README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
}
