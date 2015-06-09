# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=nodejs-ungit
_npmname=ungit
pkgver=0.9.2
pkgrel=1
pkgdesc="Git made easy"
arch=('i686' 'x86_64')
depends=('nodejs')
makedepends=('npm')
url="https://github.com/FredrikNoren/ungit"
license=('MIT')
provides=('nodejs-ungit' 'ungit')
conflicts=('ungit')
options=('!emptydirs' '!strip')

package() {
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p "$_npmdir"
  cd "$_npmdir"
  npm install --user root -g --prefix "$pkgdir/usr" $_npmname@$pkgver

  msg 'Renaming binary from 0ungit-credentials-helper to ungit-credentials-helper'
  mv "$pkgdir/usr/bin/0ungit-credentials-helper" "$pkgdir/usr/bin/ungit-credentials-helper"
}
