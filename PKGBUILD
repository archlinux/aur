# Maintainer: Benigno B. Junior <benignobjunior@gmail.com>
pkgname=pgschema-bin
pkgver=1.13.4
pkgrel=1
pkgdesc='Declarative schema migration CLI for Postgres (Terraform-style)'
arch=('x86_64' 'aarch64')
url='https://github.com/pgplex/pgschema'
license=('Apache-2.0')
provides=('pgschema')
conflicts=('pgschema')
source_x86_64=("${pkgname}-${pkgver}-x86_64::${url}/releases/download/v${pkgver}/pgschema-${pkgver}-linux-amd64")
source_aarch64=("${pkgname}-${pkgver}-aarch64::${url}/releases/download/v${pkgver}/pgschema-${pkgver}-linux-arm64")
sha256sums_x86_64=('abce75a704ce411a8f9d1dcc786573d7e0e6dcc6b060a0e6b66a1550ed734bdb')
sha256sums_aarch64=('5f7d81371111033ed1df54b894b3bd6eb2cb55c5c9fee20addf2aae67abb0c99')

package() {
    install -Dm755 "${pkgname}-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/pgschema"
    install -Dm644 /dev/stdin "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE" <<'EOF'
Apache License 2.0 - See https://github.com/pgplex/pgschema/blob/main/LICENSE
EOF
}
