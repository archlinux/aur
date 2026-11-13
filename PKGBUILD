# Maintainer: John Mylchreest <jmylchreest@gmail.com>
# Render 0.0.40 and 8e5db6a77a594f837cc0ede4572e377e92fdc365fabea56c410979c8627e5569 from the signed release.
pkgname=rosec-provider-protonpass-bin
pkgver=0.0.40
pkgrel=1
pkgdesc="Proton Pass read-only provider for rosec (prebuilt)"
arch=('any')
url="https://github.com/jmylchreest/rosec"
license=('GPL-3.0-or-later')
depends=(
    'rosec>=0.0.40'
)
provides=('rosec-provider-protonpass')
conflicts=('rosec-provider-protonpass')

source=(
    "rosec-provider-protonpass-${pkgver}.wasm.tar.gz::https://github.com/jmylchreest/rosec/releases/download/v${pkgver}/rosec-provider-protonpass-${pkgver}.wasm.tar.gz"
)
sha256sums=('8e5db6a77a594f837cc0ede4572e377e92fdc365fabea56c410979c8627e5569')

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

