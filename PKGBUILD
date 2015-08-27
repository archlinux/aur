# Maintainer: FadeMind <fademind@gmail.com>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Tom Vincent <http://tlvince.com/contact>

_npmname=bower
pkgname=nodejs-$_npmname
pkgver=1.5.2
pkgrel=1
pkgdesc='The browser package manager'
arch=('any')
url='https://github.com/twitter/bower'
license=('MIT')
depends=('npm')
source=("http://registry.npmjs.org/$_npmname/-/$_npmname-$pkgver.tgz")
noextract=($_npmname-$pkgver.tgz)
md5sums=('218d35f4106d00d27c8f4930fdd64547')

package() {
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p "$_npmdir"
  cd "$_npmdir"
  npm install --user root -g --prefix "$pkgdir/usr" $_npmname@$pkgver
}

