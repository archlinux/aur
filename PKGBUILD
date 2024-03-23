# Maintainer: Oliver Ford <dev.aur@ojford.com>
# shellcheck disable=SC2034,SC2039,SC2154
pkgname=terraform-plugin-docs
pkgver=0.18.0
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

[ "$pkgarch" = "amd64" ] && sha256sums=('73596c555efc27ce21da20c5a2c1d2d379b8aa658112ab67a9561cc18fc559c2')
[ "$pkgarch" = "arm64" ] && sha256sums=('93a350a3330748e3b397911a02fafd56e4a7c2956a0639abe06178deac0b003d')

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
