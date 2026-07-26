# Maintainer: envolution
# Contributor: Tomoghno Sen <tomoghno@outlook.com>
# shellcheck shell=bash disable=SC2034,SC2154

pkgname=sgdboop-bin
_pkgname=sgdboop
pkgver=1.4.1
pkgrel=1
pkgdesc="automatically applies assets from SteamGridDB directly to your Steam library"
arch=('x86_64' 'aarch64')
url="https://www.steamgriddb.com/boop"
license=('Zlib')
conflicts=('sgdboop')
depends=('shared-mime-info')


# Common
source=("x-$_pkgname.xml")
sha512sums=("35f57bab67171e96fbe2b2a11b7a4c95f06083f95af683286eb2014f61c0ad8bbc3ce913a7adc0cfa15337725bdf414e5360ca6a813e72c1b1622171b0c0a62d")

# x86_64
source_x86_64=("$pkgname-$pkgver.tar.gz::https://github.com/SteamGridDB/SGDBoop/releases/download/v${pkgver}/sgdboop-linux-x86_64.tar.gz")
sha512sums_x86_64=("1c256666182553fa4e021307279c2f810f16c15dd50f8e01b3e9df0a2560ba17df0669614a8668bed7a2c789e7f4c2342853940a0d346dc87b2f5a2e45f42d8e")

# aarch64
source_aarch64=("$pkgname-$pkgver.tar.gz::https://github.com/SteamGridDB/SGDBoop/releases/download/v${pkgver}/sgdboop-linux-aarch64.tar.gz")
sha512sums_aarch64=("844ba5ea381a6f71520ea7aa1ce5da151c961d46808e6236179ef690260426d0519670e6cb54918b9cee88da9758d9242fa42ff3797bda3a79a25e057e695195")

package() {
  install -Dm755 "$srcdir/SGDBoop" "$pkgdir/usr/bin/SGDBoop"
  install -Dm644 "$srcdir/com.steamgriddb.SGDBoop.desktop" -t "$pkgdir/usr/share/applications"
  install -Dm644 "x-$_pkgname.xml" "$pkgdir/usr/share/mime/packages/x-$_pkgname.xml"
  install -Dm644 "$srcdir/LICENSE" -t "$pkgdir/usr/share/licenses/$pkgname"

  echo "Go to the following website and press the blue button (Step 2) to enable the boop function:"
  echo "https://www.steamgriddb.com/boop"
}
# vim:set ts=2 sw=2 et:
