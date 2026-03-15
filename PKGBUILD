# Maintainer: John Mylchreest <jmylchreest@gmail.com>
#
# AUR package: rosec-provider-bitwarden-pm-bin
#
# This PKGBUILD installs the pre-built Bitwarden Password Manager WASM
# provider for rosec from the GitHub release.
# The release workflow renders this file by substituting 0.0.17 and
# cbd90601be459dcce9ec915d4e6636a98a65055b9011cf9029ae03fd59b4e5b8 before committing to the AUR.
#
# To build manually, replace the placeholders and run makepkg -si.

pkgname=rosec-provider-bitwarden-pm-bin
pkgver=0.0.17
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
sha256sums=('cbd90601be459dcce9ec915d4e6636a98a65055b9011cf9029ae03fd59b4e5b8')

package() {
    install -Dm644 "${srcdir}/rosec_bitwarden_pm.wasm" \
        "${pkgdir}/usr/lib/rosec/providers/rosec_bitwarden_pm.wasm"
    install -Dm644 "${srcdir}/rosec_bitwarden_pm.wasm.minisig" \
        "${pkgdir}/usr/lib/rosec/providers/rosec_bitwarden_pm.wasm.minisig"
}
