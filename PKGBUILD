# Maintainer: Benigno Batista Jr <benignobjunior@gmail.com>
pkgname=pgschema-bin
pkgver=1.12.1
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
sha256sums_x86_64=('cad0845c88aa374ac4eb2f01dc999b9ed1b1c77b311c0290bb42e95c0c1cdb1b')
sha256sums_aarch64=('d95b755c58460a4eb20b65e7593e614d9860fc4c722c9bfcb8eba258790e332f')

package() {
    install -Dm755 "${pkgname}-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/pgschema"
    install -Dm644 /dev/stdin "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE" <<'EOF'
Apache License 2.0 - See https://github.com/pgplex/pgschema/blob/main/LICENSE
EOF
}
