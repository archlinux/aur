# Maintainer: Oliver Ford <dev.aur@ojford.com>
# shellcheck disable=SC2034,SC2039,SC2154
pkgname=terraform-plugin-docs
pkgver=0.13.0
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

[ "$pkgarch" = "amd64" ] && sha256sums=('4167876e830d6904340805eea8e563b66cfa4fd71f1a056cdfd2b3d55993adf7')
[ "$pkgarch" = "arm64" ] && sha256sums=('92e09b88db432d679e55aa98d0619baab89544744eed694182e30f05d8d1a872')

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
