# Maintainer: John Mylchreest <jmylchreest@gmail.com>
# Render 0.0.39 and 7e20a6459ab556759a90acf518206af177b61fa0c336d2a1e5b3a8a2d76a813c from the signed release.
pkgname=rosec-provider-protonpass-bin
pkgver=0.0.39
pkgrel=1
pkgdesc="Proton Pass read-only provider for rosec (prebuilt)"
arch=('any')
url="https://github.com/jmylchreest/rosec"
license=('GPL-3.0-or-later')
depends=(
    'rosec>=0.0.39'
)
provides=('rosec-provider-protonpass')
conflicts=('rosec-provider-protonpass')

source=(
    "rosec-provider-protonpass-${pkgver}.wasm.tar.gz::https://github.com/jmylchreest/rosec/releases/download/v${pkgver}/rosec-provider-protonpass-${pkgver}.wasm.tar.gz"
)
sha256sums=('7e20a6459ab556759a90acf518206af177b61fa0c336d2a1e5b3a8a2d76a813c')

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

