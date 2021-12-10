#!/bin/bash

# Maintainer: PumpkinCheshire <me at pumpkincheshire dot com>

_npmname=ts-standard
_npmver=11.0.0
pkgname=nodejs-ts-standard # All lowercase
pkgver=11.0.0
pkgrel=1
pkgdesc="Typescript Standard Style based on StandardJS"
arch=(any)
url="https://github.com/standard/ts-standard"
license=(MIT)
depends=('nodejs' 'npm')
optdepends=()
source=("https://registry.npmjs.org/$_npmname/-/$_npmname-$_npmver.tgz")
noextract=("$_npmname-$_npmver.tgz")
b2sums=('1bb64e42218ba9a397d5ff0cc24c0d9ced558c93cc938e0af52f586e9903a81f2e92d2205a436e83cc9f3e991918a12d67d970e30a07912588f3dc4124e3e658')

package() {
  cd "$srcdir" || exit
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p "$_npmdir"
  cd "$_npmdir" || exit
  npm install -g --prefix "$pkgdir/usr" $_npmname@$_npmver

  chown -R root:root "$pkgdir"
}

# vim:set ts=2 sw=2 et:
