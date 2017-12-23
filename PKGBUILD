# Maintainer: Michael Gwin <oksijun+arch at gmail dot com>

pkgname=terragrunt-bin
_pkgname=terragrunt
pkgver=0.13.23
pkgrel=1
pkgdesc="A thin wrapper for Terraform that provides extra tools for working with multiple Terraform modules"
url="https://github.com/gruntwork-io/terragrunt"
depends=('terraform')
conflicts=('terragrunt')
provides=('terragrunt')
license=('MIT')
arch=('x86_64')
source=(
  "terragrunt_linux_amd64-${pkgver}::https://github.com/gruntwork-io/terragrunt/releases/download/v${pkgver}/terragrunt_linux_amd64"
  "https://raw.githubusercontent.com/gruntwork-io/terragrunt/v${pkgver}/LICENSE.txt"
)
sha256sums=(
  '30f65c2874b0723fd111874bb7c2fcb8b8231b06ebd6863c0aafec49cc8911ce'
  'a462de65463e142a430b65770650f5f028d28b60e13a830ac8092506ff2c7146'
)

package() {
  install -D -m 755 "${srcdir}/terragrunt_linux_amd64-${pkgver}" "${pkgdir}/usr/bin/${_pkgname}"
  install -D -m 644 "${srcdir}/LICENSE.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
