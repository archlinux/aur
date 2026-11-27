# Maintainer: John Mylchreest <jmylchreest@gmail.com>
# Render 0.0.41 and 1d45fb22a92ecbaa72d47b391d01a3cc8db9eede323ae5f541ef1ed34b97b58d from the signed release.
pkgname=rosec-provider-protonpass-bin
pkgver=0.0.41
pkgrel=1
pkgdesc="Proton Pass read-only provider for rosec (prebuilt)"
arch=('any')
url="https://github.com/jmylchreest/rosec"
license=('GPL-3.0-or-later')
depends=(
    'rosec>=0.0.41'
)
provides=('rosec-provider-protonpass')
conflicts=('rosec-provider-protonpass')

source=(
    "rosec-provider-protonpass-${pkgver}.wasm.tar.gz::https://github.com/jmylchreest/rosec/releases/download/v${pkgver}/rosec-provider-protonpass-${pkgver}.wasm.tar.gz"
)
sha256sums=('1d45fb22a92ecbaa72d47b391d01a3cc8db9eede323ae5f541ef1ed34b97b58d')

package() {
    install -Dm644 "${srcdir}/rosec_protonpass.wasm" \
        "${pkgdir}/usr/lib/rosec/providers/rosec_protonpass.wasm"
    install -Dm644 "${srcdir}/rosec_protonpass.wasm.policy.toml" \
        "${pkgdir}/usr/lib/rosec/providers/rosec_protonpass.wasm.policy.toml"
    install -Dm644 "${srcdir}/rosec_protonpass.wasm.minisig" \
        "${pkgdir}/usr/lib/rosec/providers/rosec_protonpass.wasm.minisig"
    install -dm755 "${pkgdir}/usr/share/licenses/${pkgname}"
    cp -r "${srcdir}/protonpass-notices/." "${pkgdir}/usr/share/licenses/${pkgname}/"
}

