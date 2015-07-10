# Maintainer: Kaan Genç <SeriousBug at gmail dot com>

_npmname=pulp
pkgname=nodejs-$_npmname
pkgver=4.0.2
pkgrel=1
pkgdesc='A build system and package manager for PureScript projects.'
arch=('any')
url='https://github.com/bodil/pulp'
license=('LGPL3')
depends=('npm')
source=("http://registry.npmjs.org/$_npmname/-/$_npmname-$pkgver.tgz")
noextract=($_npmname-$pkgver.tgz)
md5sums=('0727f690a584ce58468883b34030306b')

package() {
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p "$_npmdir"
  cd "$_npmdir"
  npm install --user root -g --prefix "$pkgdir/usr" $_npmname@$pkgver
}
