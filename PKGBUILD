# Maintainer: Oliver Ford <dev.aur@ojford.com>
# shellcheck disable=SC2034,SC2039,SC2154
pkgname=terraform-plugin-docs
pkgver=0.7.0
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

[ "$pkgarch" = "amd64" ] && sha256sums=('f93d84240687cb6eb2cbc5d3ecd983c613c07c61546424fca497a2c4ee3b3f17')
[ "$pkgarch" = "arm64" ] && sha256sums=('c73dcffc86d15d55f90f2f85385a0480b7fcd760391d615180db1621b212e27f')

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
