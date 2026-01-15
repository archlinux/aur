# Maintainer: Oliver Ford <dev.aur@ojford.com>
# shellcheck disable=SC2034,SC2039,SC2154
pkgname=terraform-plugin-docs
pkgver=0.24.0
pkgrel=1
pkgdesc='Generate and validate Terraform plugin/provider documentation.'
url='https://github.com/hashicorp/terraform-plugin-docs'
license=('custom:MPL-2.0')
arch=(
    'aarch64'
    'x86_64'
)

source_aarch64=("$url/releases/download/v$pkgver/tfplugindocs_${pkgver}_linux_arm64.zip")
source_x86_64=("$url/releases/download/v$pkgver/tfplugindocs_${pkgver}_linux_amd64.zip")
sha256sums_aarch64=('2267388e510b5e40618ce0cb0a7d54dabd08dff3ff0bf869041f3310d14bfc0b')
sha256sums_x86_64=('f1c5e5d37ecdd4183c9e263da553d8f3cf577975ddabd902aacabfc89155bacb')

depends=(
)
provides=(
    'tfplugindocs=${pkgver}'
)

package() {
    set -eu
    ls -al

    install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

    mkdir -p "$pkgdir/usr/bin"
    install -D -m755 ./tfplugindocs "$pkgdir/usr/bin/"
}
