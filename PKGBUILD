# Maintainer: kryptic.sh <hello at kryptic dot sh>
#
# Auto-generated. Source: https://github.com/kryptic-sh/crcbl
# Edits made directly to the AUR repo will be overwritten on the next
# release. To change this PKGBUILD, edit `pkg/aur/PKGBUILD-bin.in` in
# the upstream repo and let `.github/workflows/ci.yml` republish.
pkgname=crcbl-bin
_pkgname=crcbl
pkgver=0.8.0
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
sha256sums_x86_64=('4f65ac50d68baad3f8e9cbc639dda3707c1c725a0c962b1f3b1f92e40f11e534')
sha256sums_aarch64=('74e37546f68751707c5ba13cb61336057a28b2f60bd76a523131ed08397f9469')

package() {
    install -Dm755 "$srcdir/crcbl" "$pkgdir/usr/bin/crcbl"
    install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 "$srcdir/README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
}
