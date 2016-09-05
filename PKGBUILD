# Maintainer: Jonas Amundsen <jonasba+aur at gmail dot com>

_npmname=cordova
pkgname=nodejs-$_npmname
pkgver=6.3.0
pkgrel=1
pkgdesc="Cordova command line interface tool"
arch=('any')
url="http://cordova.apache.org/"
license=('Apache')
depends=('nodejs' 'npm')
optdepends=('apache-ant: building for Android'
            'android-platform: building for Android'
            'android-sdk-build-tools: building for Android')
source=(https://registry.npmjs.org/$_npmname/-/$_npmname-${pkgver//_/-}.tgz)
noextract=($_npmname-${pkgver//_/-}.tgz)
sha1sums=('fe886017d03402b9e8a266c16767059036b6627e')

package() {
  cd "$srcdir"
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p "$_npmdir"
  cd "$_npmdir"
  npm install --user root -g --prefix "$pkgdir/usr" $_npmname@${pkgver//_/-}
}
