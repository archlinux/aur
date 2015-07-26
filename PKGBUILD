# Maintainer: Jonas Amundsen <jonasba+aur at gmail dot com>

_npmname=cordova
pkgname=nodejs-$_npmname
pkgver=5.1.1
pkgrel=1
pkgdesc="Cordova command line interface tool"
arch=('any')
url="http://cordova.apache.org/"
license=('Apache')
depends=('nodejs')
optdepends=('apache-ant: building for Android'
            'android-platform: building for Android'
            'android-sdk-build-tools: building for Android')
source=(http://registry.npmjs.org/$_npmname/-/$_npmname-${pkgver//_/-}.tgz)
noextract=($_npmname-${pkgver//_/-}.tgz)
sha1sums=('a9da84a4b42eac67d4b661246c7a6704c350eaae')

package() {
  cd "$srcdir"
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p "$_npmdir"
  cd "$_npmdir"
  npm install --user root -g --prefix "$pkgdir/usr" $_npmname@${pkgver//_/-}
}
