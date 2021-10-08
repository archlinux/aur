# Maintainer: Steve Engledow <steve@offend.me.uk>

pkgname=cfn-policy-validator
pkgver=0.0.4
pkgrel=1
pkgdesc="Tool that validates IAM policies in an AWS CloudFormation template"
url="https://github.com/awslabs/aws-cloudformation-iam-policy-validator"
license=('MIT')

source=("$url/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('e0a4f68a6adee40658afd81b803347e484f37a1dbe20de1474cc70230edd7fc1')
depends=('python-boto3')
makedepends=('python-distribute')
arch=('any')

build() {
  cd "$srcdir/aws-cloudformation-iam-policy-validator-${pkgver}"
  python setup.py build
}

package() {
  cd "$srcdir/aws-cloudformation-iam-policy-validator-${pkgver}"
  python setup.py install --root="$pkgdir" --optimize=1
}
