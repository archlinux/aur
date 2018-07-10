# $Id$
# Maintainer: Mohammadreza Abdollahzadeh <morealaz at gmail dot com>

_pkgname=nwjs-sdk
pkgname=$_pkgname-bin
pkgver=0.31.5
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
options=(!strip)
provides=("node-webkit" "nwjs")
conflicts=("node-webkit" "nwjs")
source=("http://dl.nwjs.io/v$pkgver/$_pkgname-v$pkgver-linux-x64.tar.gz")
sha512sums=('100b3563c7f9c70f5eba558c7e4511e056b81140621285dd73879c4a422f7c23276589422c66f2167c5e9e6572e5467aa8a35885527bc962751c2fa56cc00918')

package() {
  cd "$srcdir/$_pkgname-v$pkgver-linux-x64"
  install -d "$pkgdir/opt/$_pkgname"
  install -d "$pkgdir/usr/bin"
  cp -a * "$pkgdir/opt/$_pkgname"
  ln -s "/opt/$_pkgname/nw" "$pkgdir/usr/bin/nw"
  ln -s "/opt/$_pkgname/nwjc" "$pkgdir/usr/bin/nwjc"
}
# vim:set ts=2 sw=2 et:
