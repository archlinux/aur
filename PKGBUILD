# Maintainer: Oliver Ford <dev.aur@ojford.com>
# shellcheck disable=SC2034,SC2039,SC2154
pkgname=terraform-plugin-docs
pkgver=0.21.0
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

[ "$pkgarch" = "amd64" ] && sha256sums=('952984090ad5c5676bd5095a2455c5efb66163bd54c35b4328c58b444c3c1fe2')
[ "$pkgarch" = "arm64" ] && sha256sums=('18ed4e7be2b5d3690e0af9849eb8dba4d5b612ed8624eb1182ed4ec34d29c6b8')

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
