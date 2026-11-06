# Maintainer: Benigno B. Junior <benignobjunior@gmail.com>
pkgname=pgschema-bin
pkgver=1.14.0
pkgrel=1
pkgdesc='Declarative schema migration CLI for Postgres (Terraform-style)'
arch=('x86_64' 'aarch64')
url='https://github.com/pgplex/pgschema'
license=('Apache-2.0')
provides=('pgschema')
conflicts=('pgschema')
source_x86_64=("${pkgname}-${pkgver}-x86_64::${url}/releases/download/v${pkgver}/pgschema-${pkgver}-linux-amd64")
source_aarch64=("${pkgname}-${pkgver}-aarch64::${url}/releases/download/v${pkgver}/pgschema-${pkgver}-linux-arm64")
sha256sums_x86_64=('4454e4be42984368d2443265c7b433994d5fd86a5bb311192053126afd23979f')
sha256sums_aarch64=('f94f7b0a46d996d93d2fb2a9fb0d089e5b144b776ea47a26770d78962b2a2f25')

package() {
    install -Dm755 "${pkgname}-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/pgschema"
    install -Dm644 /dev/stdin "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE" <<'EOF'
Apache License 2.0 - See https://github.com/pgplex/pgschema/blob/main/LICENSE
EOF
}
