# Maintainer: Christian Pfeiffer <cpfeiffer at rev-crew dot info>
# Contributor: Vinay S Shastry <vinayshastry at gmail dot com>
# shellcheck disable=SC2034,SC2154
# shellcheck shell=bash

pkgname=flarectl-bin
_pkgname="${pkgname%-bin}"
pkgver=0.119.0
pkgrel=1
pkgdesc='CLI application for interacting with a Cloudflare account'
arch=('x86_64' 'aarch64')
url='https://github.com/cloudflare/cloudflare-go'
license=('Apache-2.0')
provides=("$_pkgname")
conflicts=("$_pkgname")
options=('!debug')
_source_base="${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux"
source_x86_64=("${_source_base}_amd64.tar.gz")
source_aarch64=("${_source_base}_arm64.tar.gz")
sha512sums_x86_64=('05f502552d3300780276908cdfe193235bcb39e4c6ef8f16b7072118de1dedb90a6f160343bdeadbe7c27779cc6e52383640615b437b0c3db8988a0a240bff39')
sha512sums_aarch64=('1a2e02e1bfc4695c673b31928bb96dbf8d2c0e9fa3064da52b411f366028acddf69af9348b0d96ffc2441ebb5fa81823b745ab193be6a52d290ca915fe46ff9b')
b2sums_x86_64=('2e088798399b342db5aff85ce0aa12c493bed5a9d9a9964a8d829fbf596e1dbf05cf6f35b9f55e7efefc19eaaa16f4d1aebc87419a40c1a2b43fb6097397ad6b')
b2sums_aarch64=('81f9da450b41cd08a4fb635761bb563172e7745af09cee7adc70b7d8b9e2f9e6cb04c8fe0f05f55f3193398d4a21bc11e4becbc63adf8460db80a8333f49144a')

package() {
  install -D --mode 755 "$_pkgname" --target-directory "${pkgdir}/usr/bin"
  install -D --mode 644 LICENSE --target-directory "${pkgdir}/usr/share/licenses/${_pkgname}"
  install -D --mode 644 README.md --target-directory "${pkgdir}/usr/share/doc/${_pkgname}"
}
