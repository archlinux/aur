# shellcheck disable=SC2034
# shellcheck disable=SC2154
# Maintainer: Pat Brisbin <pbrisbin@gmail.com>
pkgname=okta-aws-cli-assume-role
pkgver=1.0.2
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
md5sums=('e1539c42e5786c553f33c93d1daca067'
         '56043c3110e422b9b7543a246a80e106')

package() {
  cd "$srcdir" || exit 1

  install -Dm 644 okta-aws-cli-$pkgver.jar "$pkgdir/usr/share/java/okta-aws-cli/okta-aws-cli.jar"
  install -Dm 755 okta-aws-cli-login "$pkgdir/usr/bin/okta-aws-cli-login"
}
