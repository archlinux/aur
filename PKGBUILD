# $Id$
# Maintainer: Mohammadreza Abdollahzadeh <morealaz at gmail dot com>
# Contributor: Josia Roßkopf <josia-login@rosskopfs.de>
# Contributor: Jonas Heinrich <onny@project-insanity.org>
# Contributor: Yen Chi Hsuan <yan12125 at gmail.com>

_pkgname=nwjs
pkgname=$_pkgname-bin
pkgver=0.31.5
pkgrel=1
pkgdesc="An app runtime based on Chromium and node.js."
arch=("x86_64")
url="https://nwjs.io/"
license=("MIT")
depends=("alsa-lib" "gconf" "gtk2" "nss" "ttf-font" "libxtst" "libxss")
optdepends=(
    "nodejs: npm package support"
    "nw-gyp: native add-on build tool for node-webkit"
)
provides=("nwjs" "node-webkit")
replaces=("node-webkit")
conflicts=("nwjs" "node-webkit")
source=("http://dl.nwjs.io/v$pkgver/$_pkgname-v$pkgver-linux-x64.tar.gz")
sha512sums=('f0b1c4ce99a463a74cc76cd6f75955502897c28708489a2df174e8dd75b11f1ab1a1b032de5dfdc38d213952b8f5dd9b58f9bc8d54eb150263a85997e1622b5b')

package() {
  cd "$srcdir/$_pkgname-v$pkgver-linux-x64"
  install -d "$pkgdir/opt/$_pkgname"
  install -d "$pkgdir/usr/bin"
  cp -a * "$pkgdir/opt/$_pkgname"
  ln -s "/opt/$_pkgname/nw" "$pkgdir/usr/bin/nw"
}
# vim:set ts=2 sw=2 et:
