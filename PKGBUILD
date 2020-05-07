# Maintainer: Benjamin Denhartog <ben@sudoforge.com>

pkgname=terragrunt-bin
pkgver=0.23.14
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
            'e39cea3b484098ba48f956d411d46b21c44e5d342a2eb51980d834d064e6bcf7')

package() {
  install -D -m 644 "${srcdir}/LICENSE.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -D -m 755 "${srcdir}/${source[1]%%::*}" "${pkgdir}/usr/bin/${pkgname%-bin}"
}

# vim:set ts=2 sw=2 et:
