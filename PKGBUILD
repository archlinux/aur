# Maintainer: John Mylchreest <jmylchreest@gmail.com>
#
# AUR package: rosec-provider-bitwarden-pm-bin
#
# This PKGBUILD installs the pre-built Bitwarden Password Manager WASM
# provider for rosec from the GitHub release.
# The release workflow renders this file by substituting 0.0.21 and
# 74293adfe6af1523439795e2e0019b3ecd26fb3bb4a7b0f7f2df7cd5c4a1e2f8 before committing to the AUR.
#
# To build manually, replace the placeholders and run makepkg -si.

pkgname=rosec-provider-bitwarden-pm-bin
pkgver=0.0.21
pkgrel=1
pkgdesc="Bitwarden Password Manager provider for rosec (sync, SSH keys) (prebuilt)"
arch=('any')
url="https://github.com/jmylchreest/rosec"
license=('MIT')
depends=(
    'rosec'
)
provides=('rosec-provider-bitwarden-pm')
conflicts=('rosec-provider-bitwarden-pm')

source=(
    "rosec-provider-bitwarden-pm-${pkgver}.wasm.tar.gz::https://github.com/jmylchreest/rosec/releases/download/v${pkgver}/rosec-provider-bitwarden-pm-${pkgver}.wasm.tar.gz"
)
sha256sums=('74293adfe6af1523439795e2e0019b3ecd26fb3bb4a7b0f7f2df7cd5c4a1e2f8')

package() {
    install -Dm644 "${srcdir}/rosec_bitwarden_pm.wasm" \
        "${pkgdir}/usr/lib/rosec/providers/rosec_bitwarden_pm.wasm"
    install -Dm644 "${srcdir}/rosec_bitwarden_pm.wasm.minisig" \
        "${pkgdir}/usr/lib/rosec/providers/rosec_bitwarden_pm.wasm.minisig"
}
