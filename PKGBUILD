# Maintainer: FadeMind <fademind@gmail.com>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Tom Vincent <http://tlvince.com/contact>

_npmname=bower
pkgname=nodejs-$_npmname
pkgver=1.4.1
pkgrel=3
pkgdesc='The browser package manager'
arch=('any')
url='https://github.com/twitter/bower'
license=('MIT')
depends=('npm')
source=("http://registry.npmjs.org/$_npmname/-/$_npmname-$pkgver.tgz")
noextract=($_npmname-$pkgver.tgz)
md5sums=('df81b015316062da0ac7ab64a4677fb2')

package() {
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p "$_npmdir"
  cd "$_npmdir"
  npm install --user root -g --prefix "$pkgdir/usr" $_npmname@$pkgver
}

