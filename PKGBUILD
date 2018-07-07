# $Id$
# Maintainer: Mohammadreza Abdollahzadeh <morealaz at gmail dot com>

_pkgname=nwjs-sdk
pkgname=$_pkgname-bin
pkgver=0.31.4
pkgrel=1
pkgdesc="An app runtime based on Chromium and node.js (SDK version)."
arch=("x86_64")
url="https://nwjs.io/"
license=("MIT")
depends=("alsa-lib" "gconf" "gtk3" "nss" "ttf-font" "libxtst" "libxss")
optdepends=(
    "nodejs: npm package support"
    "nw-gyp: native add-on build tool for node-webkit"
)
provides=("node-webkit" "nwjs")
conflicts=("node-webkit" "nwjs")
source=("http://dl.nwjs.io/v$pkgver/$_pkgname-v$pkgver-linux-x64.tar.gz")
sha512sums=('d920dd997d9123ad9551a96b35a47cf5d15419d1a707d4c8ae2ba51b5a5123fc78792e37bb4bcf8396eef34d08cc12f63c76dbca0ffeed7fe9fa38800d0f5266')

package() {
  cd "$srcdir/$_pkgname-v$pkgver-linux-x64"
  install -d "$pkgdir/opt/$_pkgname"
  install -d "$pkgdir/usr/bin"
  cp -a * "$pkgdir/opt/$_pkgname"
  ln -s "/opt/$_pkgname/nw" "$pkgdir/usr/bin/nw"
  ln -s "/opt/$_pkgname/nwjc" "$pkgdir/usr/bin/nwjc"
}
# vim:set ts=2 sw=2 et:
