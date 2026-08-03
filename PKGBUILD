# Maintainer: envolution
# Contributor: Tomoghno Sen <tomoghno@outlook.com>
# shellcheck shell=bash disable=SC2034,SC2154

pkgname=sgdboop-bin
_pkgname=sgdboop
pkgver=1.4.3
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
sha512sums_x86_64=("83e547809ebd8d7c261d937e570a779d612b1b6bca8d11782216eca6f86123bcaa92334e9c3c8473fa86248d5c114198943ca279a79975d010484c50ec272544")

# aarch64
source_aarch64=("$pkgname-$pkgver.tar.gz::https://github.com/SteamGridDB/SGDBoop/releases/download/v${pkgver}/sgdboop-linux-aarch64.tar.gz")
sha512sums_aarch64=("07b2f783daae3aaf5be23190ed3c03c574da265e6d292e0db6a09b7c2e7efc2dcb798a3966e03f937c6c018f5559414b6bec0df41d51e7b8d08ea62ebd99d399")

package() {
  install -Dm755 "$srcdir/SGDBoop" "$pkgdir/usr/bin/SGDBoop"
  install -Dm644 "$srcdir/com.steamgriddb.SGDBoop.desktop" -t "$pkgdir/usr/share/applications"
  install -Dm644 "x-$_pkgname.xml" "$pkgdir/usr/share/mime/packages/x-$_pkgname.xml"
  install -Dm644 "$srcdir/LICENSE" -t "$pkgdir/usr/share/licenses/$pkgname"

  echo "Go to the following website and press the blue button (Step 2) to enable the boop function:"
  echo "https://www.steamgriddb.com/boop"
}
# vim:set ts=2 sw=2 et:

