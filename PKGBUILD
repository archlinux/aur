# Maintainer: Jonas Amundsen <jonasba+aur at gmail dot com>

_npmname=cordova
pkgname=nodejs-$_npmname
pkgver=6.2.0
pkgrel=1
pkgdesc="Cordova command line interface tool"
arch=('any')
url="http://cordova.apache.org/"
license=('Apache')
depends=('nodejs' 'npm')
optdepends=('apache-ant: building for Android'
            'android-platform: building for Android'
            'android-sdk-build-tools: building for Android')
source=(http://registry.npmjs.org/$_npmname/-/$_npmname-${pkgver//_/-}.tgz)
noextract=($_npmname-${pkgver//_/-}.tgz)
sha1sums=('8442ec6f4d4440bc124713d32139d78efa1b72ce')

package() {
  cd "$srcdir"
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p "$_npmdir"
  cd "$_npmdir"
  npm install --user root -g --prefix "$pkgdir/usr" $_npmname@${pkgver//_/-}
}
