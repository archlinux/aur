# Maintainer: William Snyders <iam2391212@gmail.com>

pkgname=aws-okta-bin
_pkgname=aws-okta
pkgdesc="Log in to AWS with Okta"
pkgver=1.0.1
pkgrel=1
arch=('x86_64')
url="https://github.com/segmentio/aws-okta"
license=('MIT')
provides=('aws-okta')
_aws_okta_bin=aws-okta-v$pkgver-linux-amd64
source=(
  $_aws_okta_bin::https://github.com/segmentio/aws-okta/releases/download/v$pkgver/aws-okta-v$pkgver-linux-amd64
  LICENSE::https://github.com/segmentio/aws-okta/raw/v$pkgver/LICENSE
)
sha256sums=(
  'c73f7c8bfc15c4b58582e0706a05046f4c723409febd769d1841ce619ba49549'
  'feaff489d3c077f7b48cf76a5f038604338a092be379c1297c64c26c6b81714b'
)

package() {
  install -Dm 755 "$srcdir/$_aws_okta_bin" "$pkgdir/usr/bin/$_pkgname"
  install -Dm 644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
}
