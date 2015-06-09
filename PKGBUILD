# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=nodejs-n
_npmname=n
pkgver=1.3.0
pkgrel=1
pkgdesc="Node version manager"
arch=('any')
depends=('nodejs')
makedepends=('npm')
url="https://github.com/tj/n"
license=('MIT')
provides=('n' 'nodejs-n')
conflicts=('n')

package() {
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p "$_npmdir"
  cd "$_npmdir"
  npm install --user root -g --prefix "$pkgdir/usr" $_npmname@$pkgver
}
