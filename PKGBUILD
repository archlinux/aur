# Maintainer: envolution
# Contributor: Tomoghno Sen <tomoghno@outlook.com>
# shellcheck shell=bash disable=SC2034,SC2154

pkgname=sgdboop-bin
_pkgname=sgdboop
pkgver=1.4.4
pkgrel=1
pkgdesc="automatically applies assets from SteamGridDB directly to your Steam library"
arch=('x86_64' 'aarch64')
url="https://www.steamgriddb.com/boop"
license=('Zlib')
conflicts=('sgdboop')
provides=('sgdboop')
depends=('curl' 'glib2' 'gtk3')
options=('!debug')


# Common
source=("x-$_pkgname.xml")
sha512sums=("35f57bab67171e96fbe2b2a11b7a4c95f06083f95af683286eb2014f61c0ad8bbc3ce913a7adc0cfa15337725bdf414e5360ca6a813e72c1b1622171b0c0a62d")

# x86_64
source_x86_64=("$pkgname-$pkgver.tar.gz::https://github.com/SteamGridDB/SGDBoop/releases/download/v${pkgver}/sgdboop-linux-x86_64.tar.gz")
sha512sums_x86_64=("60171994d6cc5ecc9e1e1260c3c09f46f8835c5237817db525a9d04b4aefdb5e5ad397732b412992129167b8403fcaccce0726fda199ba72735ea9d4fc3f5d1b")

# aarch64
source_aarch64=("$pkgname-$pkgver.tar.gz::https://github.com/SteamGridDB/SGDBoop/releases/download/v${pkgver}/sgdboop-linux-aarch64.tar.gz")
sha512sums_aarch64=("1f29d8e621bddca79f71cc6e88673e5b6f9506000b693cdd5171c0793608c7dea7fdb181eb8eeb73eae4a54cd521dca7137719fcc90d5608d34002342e7659a2")

package() {
  install -Dm755 "$srcdir/SGDBoop" "$pkgdir/usr/bin/SGDBoop"
  install -Dm644 "$srcdir/com.steamgriddb.SGDBoop.desktop" -t "$pkgdir/usr/share/applications"
  install -Dm644 "$srcdir/x-$_pkgname.xml" "$pkgdir/usr/share/mime/packages/x-$_pkgname.xml"
  install -Dm644 "$srcdir/LICENSE" -t "$pkgdir/usr/share/licenses/$pkgname"

  echo "Go to the following website and press the blue button (Step 2) to enable the boop function:"
  echo "https://www.steamgriddb.com/boop"
}
# vim:set ts=2 sw=2 et:

