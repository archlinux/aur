# Maintainer: Benjamin Denhartog <ben@sudoforge.com>

pkgname=terragrunt-bin
pkgver=0.21.9
pkgrel=1
pkgdesc="A thin wrapper for Terraform that provides extra tools for working with multiple Terraform modules"
url="https://github.com/gruntwork-io/terragrunt"
depends=('terraform')
conflicts=('terragrunt')
provides=('terragrunt')
license=('MIT')
arch=('x86_64')
source=(
  "https://raw.githubusercontent.com/gruntwork-io/terragrunt/v${pkgver}/LICENSE.txt"
  "terragrunt_linux_amd64-${pkgver}::https://github.com/gruntwork-io/terragrunt/releases/download/v${pkgver}/terragrunt_linux_amd64"
)
sha256sums=('a462de65463e142a430b65770650f5f028d28b60e13a830ac8092506ff2c7146'
            '29f3215b6981069a562609a03b61d052a123f6526f66b9739c8319c9ba7861e4')

package() {
  install -D -m 644 "${srcdir}/LICENSE.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -D -m 755 "${srcdir}/${source[1]%%::*}" "${pkgdir}/usr/bin/${pkgname%-bin}"
}

# vim:set ts=2 sw=2 et:
