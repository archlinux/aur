# Maintainer: Kazuya Yokogawa <mapk0y at gmail.com>

pkgname='cfn-guard'
pkgver=1.0.0
pkgrel=1
pkgdesc='A set of tools to check AWS CloudFormation templates for policy compliance using a simple, policy-as-code, declarative syntax'
url='https://github.com/aws-cloudformation/cloudformation-guard'
license=('Apache')
arch=('x86_64')
depends=('gcc-libs')
provides=("${pkgname}-git")
source=("${pkgname}-${pkgver}.tar.gz::${url}/releases/download/${pkgver}/${pkgname}-linux-${pkgver}.tar.gz")
sha256sums=('e8b9e503257baaefdabb74311813b6d44eac64e05f10b9157569e5828d14370e')

package() {
  install -Dm755 ${srcdir}/cfn-guard-linux/cfn-guard "$pkgdir/usr/bin/cfn-guard"
  install -Dm644 ${srcdir}/cfn-guard-linux/LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 ${srcdir}/cfn-guard-linux/README.md "$pkgdir/usr/share/doc/${pkgname}/README.md"
  install -Dm644 ${srcdir}/cfn-guard-linux/ATTRIBUTION "$pkgdir/usr/share/doc/${pkgname}/ATTRIBUTION"
  install -Dm644 ${srcdir}/cfn-guard-linux/NOTICE "$pkgdir/usr/share/doc/${pkgname}/NOTICE"
}
