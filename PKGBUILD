# Maintainer: John Mylchreest <jmylchreest@gmail.com>
#
# AUR package: rosec-provider-bitwarden-pm-bin
#
# This PKGBUILD installs the pre-built Bitwarden Password Manager WASM
# provider for rosec from the GitHub release.
# The release workflow renders this file by substituting 0.0.37 and
# eff2b0729430832b5fd895d6d2779324c14f162222d83e11a3d71679aff74857 before committing to the AUR.
#
# To build manually, replace the placeholders and run makepkg -si.

pkgname=rosec-provider-bitwarden-pm-bin
pkgver=0.0.37
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
sha256sums=('eff2b0729430832b5fd895d6d2779324c14f162222d83e11a3d71679aff74857')

package() {
    install -Dm644 "${srcdir}/rosec_bitwarden_pm.wasm" \
        "${pkgdir}/usr/lib/rosec/providers/rosec_bitwarden_pm.wasm"
    install -Dm644 "${srcdir}/rosec_bitwarden_pm.wasm.policy.toml" \
        "${pkgdir}/usr/lib/rosec/providers/rosec_bitwarden_pm.wasm.policy.toml"
    install -Dm644 "${srcdir}/rosec_bitwarden_pm.wasm.minisig" \
        "${pkgdir}/usr/lib/rosec/providers/rosec_bitwarden_pm.wasm.minisig"
}
