# Maintainer: Sergio Tridente <tioduke .at. gmail .dot. com>

_npmname=generator-aspnet
pkgname=nodejs-generator-aspnet
pkgver=0.0.93
pkgrel=1
pkgdesc="Yeoman generator for ASP.Net"
arch=('any')
url="https://github.com/omnisharp/generator-aspnet"
license=('APACHE')
depends=('nodejs-yeoman')
options=('!emptydirs')
source=("http://registry.npmjs.org/$_npmname/-/$_npmname-$pkgver.tgz")
noextract=($_npmname-$_npmver.tgz)

package() {
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p "$_npmdir"
  cd "$_npmdir"
  npm install -g --user root --prefix "$pkgdir/usr" $_npmname@$pkgver
  rm -rf "$pkgdir"/usr/bin
  rm -rf "$pkgdir"/usr/lib/node_modules/{grunt-cli,bower,yo}
}
 
sha256sums=('db38ad5d1a9ef3165b7e7de9bc5db07fe5a087a6eb227a20f4a3484331f8f0d4')
