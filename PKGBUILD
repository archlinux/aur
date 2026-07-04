# Maintainer: John Mylchreest <jmylchreest@gmail.com>
#
# AUR package: rosec-provider-bitwarden-sm-bin
#
# This PKGBUILD installs the pre-built Bitwarden Secrets Manager WASM
# provider for rosec from the GitHub release.
# The release workflow renders this file by substituting 0.0.32 and
# aa91b8e5c50ea8b3cb20fdcfadd0b31fc38fac50b5e0450ae5d537e12e3cf534 before committing to the AUR.
#
# To build manually, replace the placeholders and run makepkg -si.

pkgname=rosec-provider-bitwarden-sm-bin
pkgver=0.0.32
pkgrel=1
pkgdesc="Bitwarden Secrets Manager provider for rosec (sync) (prebuilt)"
arch=('any')
url="https://github.com/jmylchreest/rosec"
license=('MIT')
depends=(
    'rosec'
)
provides=('rosec-provider-bitwarden-sm')
conflicts=('rosec-provider-bitwarden-sm')

source=(
    "rosec-provider-bitwarden-sm-${pkgver}.wasm.tar.gz::https://github.com/jmylchreest/rosec/releases/download/v${pkgver}/rosec-provider-bitwarden-sm-${pkgver}.wasm.tar.gz"
)
sha256sums=('aa91b8e5c50ea8b3cb20fdcfadd0b31fc38fac50b5e0450ae5d537e12e3cf534')

package() {
    install -Dm644 "${srcdir}/rosec_bitwarden_sm.wasm" \
        "${pkgdir}/usr/lib/rosec/providers/rosec_bitwarden_sm.wasm"
    install -Dm644 "${srcdir}/rosec_bitwarden_sm.wasm.policy.toml" \
        "${pkgdir}/usr/lib/rosec/providers/rosec_bitwarden_sm.wasm.policy.toml"
    install -Dm644 "${srcdir}/rosec_bitwarden_sm.wasm.minisig" \
        "${pkgdir}/usr/lib/rosec/providers/rosec_bitwarden_sm.wasm.minisig"
}
