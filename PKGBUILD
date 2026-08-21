# Maintainer: Benigno Batista Jr <benignobjunior@gmail.com>
pkgname=pgschema-bin
pkgver=1.12.4
pkgrel=1
pkgdesc='Declarative schema migration CLI for Postgres (Terraform-style)'
arch=('x86_64' 'aarch64')
url='https://github.com/pgplex/pgschema'
license=('Apache-2.0')
depends=('glibc')
provides=('pgschema')
conflicts=('pgschema')
source_x86_64=("${pkgname}-${pkgver}-x86_64::${url}/releases/download/v${pkgver}/pgschema-${pkgver}-linux-amd64")
source_aarch64=("${pkgname}-${pkgver}-aarch64::${url}/releases/download/v${pkgver}/pgschema-${pkgver}-linux-arm64")
sha256sums_x86_64=('693111ec8c9cf3203e958942336c3d9000628c99023914b5122657a7d51147d2')
sha256sums_aarch64=('d06b0d246331122974b32c3338c86298e1575732fb82574239bd1a1d9fc336e9')

package() {
    install -Dm755 "${pkgname}-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/pgschema"
    install -Dm644 /dev/stdin "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE" <<'EOF'
Apache License 2.0 - See https://github.com/pgplex/pgschema/blob/main/LICENSE
EOF
}
