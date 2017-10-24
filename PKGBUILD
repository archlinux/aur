# Maintainer: Michael Gwin <oksijun+arch at gmail dot com>

pkgname=terragrunt-bin
_pkgname=terragrunt
pkgver=0.13.14
pkgrel=1
pkgdesc="A thin wrapper for Terraform that provides extra tools for working with multiple Terraform modules"
url="https://github.com/gruntwork-io/terragrunt"
depends=('terraform')
conflicts=('terragrunt')
provides=('terragrunt')
license=('MIT')
arch=('x86_64')
source=(
  "https://github.com/gruntwork-io/terragrunt/releases/download/v${pkgver}/terragrunt_linux_amd64"
  "https://raw.githubusercontent.com/gruntwork-io/terragrunt/v${pkgver}/LICENSE.txt"
)
sha256sums=(
  'cbf6b3f3d447a6ee79e2918ed4da1bd6a68332aa9e5dc40262a74a16c7eab8d8'
  'a462de65463e142a430b65770650f5f028d28b60e13a830ac8092506ff2c7146'
)

package() {
  install -D -m 755 "${srcdir}/terragrunt_linux_amd64" "${pkgdir}/usr/bin/${_pkgname}"
  install -D -m 644 "${srcdir}/LICENSE.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
