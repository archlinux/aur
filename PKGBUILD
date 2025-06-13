# Maintainer: envolution
# Contributor: Tomoghno Sen <tomoghno@outlook.com>
# shellcheck shell=bash disable=SC2034,SC2154

pkgname=sgdboop-bin
_pkgname=sgdboop
pkgver=1.3.1
pkgrel=1
pkgdesc="automatically applies assets from SteamGridDB directly to your Steam library"
arch=('x86_64')
url="https://www.steamgriddb.com/boop"
license=('Zlib')
conflicts=('sgdboop')
depends=('shared-mime-info')

source=("https://github.com/SteamGridDB/SGDBoop/releases/download/v${pkgver}/sgdboop-linux64.tar.gz"
  "x-$_pkgname.xml")
sha512sums=('eaec0cc31206f2fe966692d922ba402c052cbe44fbd0f4cf375ba7fa4ac6a3d080b529913a1822bca17afe445f97c374d8a46b02657ace5281f0ad6a95fa3867'
            '35f57bab67171e96fbe2b2a11b7a4c95f06083f95af683286eb2014f61c0ad8bbc3ce913a7adc0cfa15337725bdf414e5360ca6a813e72c1b1622171b0c0a62d')

package() {
  install -Dm755 "$srcdir/SGDBoop" "$pkgdir/usr/bin/SGDBoop"
  install -Dm644 "$srcdir/com.steamgriddb.SGDBoop.desktop" -t "$pkgdir/usr/share/applications"
  install -Dm644 "x-$_pkgname.xml" "$pkgdir/usr/share/mime/packages/x-$_pkgname.xml"
  install -Dm644 "$srcdir/LICENSE" -t "$pkgdir/usr/share/licenses/$pkgname"

  echo "Go to the following website and press the blue button (Step 2) to enable the boop function:"
  echo "https://www.steamgriddb.com/boop"
}
# vim:set ts=2 sw=2 et:
