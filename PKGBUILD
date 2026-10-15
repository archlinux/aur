# Maintainer: Benigno B. Junior <benignobjunior@gmail.com>
pkgname=pgschema-bin
pkgver=1.13.3
pkgrel=1
pkgdesc='Declarative schema migration CLI for Postgres (Terraform-style)'
arch=('x86_64' 'aarch64')
url='https://github.com/pgplex/pgschema'
license=('Apache-2.0')
provides=('pgschema')
conflicts=('pgschema')
source_x86_64=("${pkgname}-${pkgver}-x86_64::${url}/releases/download/v${pkgver}/pgschema-${pkgver}-linux-amd64")
source_aarch64=("${pkgname}-${pkgver}-aarch64::${url}/releases/download/v${pkgver}/pgschema-${pkgver}-linux-arm64")
sha256sums_x86_64=('83d5c6c08e19cdf09bbc00c44aa60ae7fd6047760e4107f17182a60915f2ae14')
sha256sums_aarch64=('12a439ef4fb02fce845470f0dec57e4b031aee30c17103e52e94814f725d9a8f')

package() {
    install -Dm755 "${pkgname}-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/pgschema"
    install -Dm644 /dev/stdin "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE" <<'EOF'
Apache License 2.0 - See https://github.com/pgplex/pgschema/blob/main/LICENSE
EOF
}
