# Maintainer: Oliver Ford <dev.aur@ojford.com>
# shellcheck disable=SC2034,SC2039,SC2154
pkgname=terraform-plugin-docs
pkgver=0.5.0
pkgrel=1
pkgdesc='Generate and validate Terraform plugin/provider documentation.'
url='https://github.com/hashicorp/terraform-plugin-docs'
license=('custom:MPL-2.0')
arch=(
    'aarch64'
    'x86_64'
)
[ "$CARCH" = "x86_64" ] && pkgarch=amd64
[ "$CARCH" = "aarch64" ] && pkgarch=arm64
source=("$url/releases/download/v$pkgver/tfplugindocs_${pkgver}_linux_${pkgarch}.zip")

[ "$pkgarch" = "amd64" ] && sha256sums=('05b79f9ab02f561386c343634d141445eeef83ccdb49c8e220b64fcd8b54a371')
[ "$pkgarch" = "arm64" ] && sha256sums=('da9ab5cdb038ce111b44fc3b4aff787e12998d601ea4200ef9e9d1bfcfc0a617')

depends=(
)
provides=(
)

package() {
    set -eu
    ls -al

    install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

    mkdir -p "$pkgdir/usr/bin"
    install -D -m755 ./tfplugindocs "$pkgdir/usr/bin/"
}
