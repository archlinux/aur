# Maintainer: Mohammadreza Abdollahzadeh <morealaz at gmail dot com>

_pkgname=nwjs-sdk
pkgname=$_pkgname-bin
pkgver=0.31.1
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
sha512sums=('8ef6cc7c7753beeffece323a04c6ef838e6ed9e3b2ed1f89596764b4036177ab267fdf45b46c37bde09433e956bfe2d56e09846da2028813cf8725e05963ea20')

package() {
  cd "$srcdir/$_pkgname-v$pkgver-linux-x64"
  install -d "$pkgdir/opt/$_pkgname"
  install -d "$pkgdir/usr/bin"
  cp -a * "$pkgdir/opt/$_pkgname"
  ln -s "/opt/$_pkgname/nw" "$pkgdir/usr/bin/nw"
}
# vim:set ts=2 sw=2 et:
