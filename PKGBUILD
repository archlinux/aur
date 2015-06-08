# Maintainer: Micha Alt <micha.tucker at gmail dot com>

_npmname=gulp
pkgname=nodejs-$_npmname
pkgver=3.9.0
pkgrel=1
pkgdesc="The streaming build system"
arch=('any')
url="http://gulpjs.com/"
license=('MIT')
depends=('nodejs')
makedepends=('npm')
source=(https://registry.npmjs.org/$_npmname/-/$_npmname-$pkgver.tgz
       'LICENSE')
noextract=($_npmname-$pkgver.tgz)
md5sums=('5b35a2a4187c45f6ea4e74a5f47de0f9'
         '196006ee5e61740475b5d1fea5b285a1')

package() {
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  cd "$srcdir"
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p "$_npmdir"
  cd "$_npmdir"
  npm install --user root -g --prefix "$pkgdir/usr" $_npmname@$pkgver
}
