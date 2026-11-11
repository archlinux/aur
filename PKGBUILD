# Maintainer: agony <27015 at riseup dot net>

pkgname=terratag-bin
pkgver=0.8.3
pkgrel=1
pkgdesc='Automatically create and maintain tags across AWS, Azure and GCP resources in Terraform (prebuilt)'
arch=('x86_64' 'aarch64')
url='https://github.com/env0/terratag'
license=('MPL-2.0')
optdepends=('opentofu: provider schemas for Terraform files'
            'terraform: provider schemas for Terraform files'
            'terragrunt: tagging Terragrunt projects')
provides=("terratag=${pkgver}")
conflicts=('terratag')
_release="${url}/releases/download/v${pkgver}"
source_x86_64=("${_release}/terratag_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("${_release}/terratag_${pkgver}_linux_arm64.tar.gz")
sha256sums_x86_64=('f63febf644e99680ba795ec836393b92beac56ed85f2bcf99c14c92027255aeb')
sha256sums_aarch64=('c43733c59f8eb18412875cff3d71effed5de0c38252415be7aa25fcbcbdab172')

package() {
  install -Dm755 terratag -t "${pkgdir}/usr/bin"
}
