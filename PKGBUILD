# shellcheck disable=SC2034
# shellcheck disable=SC2154
# Maintainer: Pat Brisbin <pbrisbin@gmail.com>
pkgname=okta-aws-cli-assume-role
pkgver=1.0.4
pkgrel=1
pkgdesc="Okta AWS CLI Assume Role Tool"
arch=('any')
url=https://github.com/oktadeveloper/okta-aws-cli-assume-role
license=('Apache')
depends=(java-runtime)
source=(
  "$url/releases/download/v$pkgver/okta-aws-cli-$pkgver.jar"
  okta-aws-cli-login
)
noextract=("okta-aws-cli-$pkgver.jar")
md5sums=('6f730b42ded5f6141647eb0cd5997dc8'
         'df2e1d5492d2ab7608c2cdf110dfd91d')

package() {
  cd "$srcdir" || exit 1

  install -Dm 644 okta-aws-cli-$pkgver.jar "$pkgdir/usr/share/java/okta-aws-cli/okta-aws-cli.jar"
  install -Dm 755 okta-aws-cli-login "$pkgdir/usr/bin/okta-aws-cli-login"
}
