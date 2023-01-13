# shellcheck disable=SC2034
# shellcheck disable=SC2154
# Maintainer: Pat Brisbin <pbrisbin@gmail.com>
pkgname=okta-aws-cli-assume-role
pkgver=3.0.0
pkgrel=1
pkgdesc="Okta AWS CLI Assume Role Tool"
arch=('any')
url=https://github.com/oktadeveloper/okta-aws-cli-assume-role
license=('Apache')
depends=(jre11-openjdk-headless)
source=(
  "$url/releases/download/v$pkgver/okta-aws-cli-$pkgver.jar"
  okta-aws-cli-login
)
noextract=("okta-aws-cli-$pkgver.jar")
sha256sums=('d57b8fd6de20e2bf595782690c273eb806aa555ceab20d5fa7608774f49aee78'
            '83aa504c3fdc2b7549f4e656ef69ea9ffa67ba72fc32a2c1a5c46e282371a398')

package() {
  cd "$srcdir" || exit 1

  install -Dm 644 okta-aws-cli-$pkgver.jar "$pkgdir/usr/share/java/okta-aws-cli/okta-aws-cli.jar"
  install -Dm 755 okta-aws-cli-login "$pkgdir/usr/bin/okta-aws-cli-login"
}
