# Maintainer: Pierre Schmitz <pierre@archlinux.de>

_npmname=sharp-cli
pkgname=nodejs-sharp-cli
pkgver=1.7.1
pkgrel=1
pkgdesc='CLI for sharp'
arch=('x86_64')
url='https://github.com/vseventer/sharp-cli'
license=('MIT')
depends=('nodejs' 'glib2' 'expat')
makedepends=('npm')
source=("https://registry.npmjs.org/$_npmname/-/$_npmname-$pkgver.tgz")
noextract=("$_npmname-$pkgver.tgz")
sha256sums=('67984fb02c84a38b04fa473e0a6c877c804d81989b3d68c98e619f7faa955a74')

package() {
  cd $srcdir
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p $_npmdir
  cd $_npmdir
  npm install -g --prefix "$pkgdir/usr" $_npmname@$pkgver
  find "$pkgdir/usr" -type d -exec chmod 755 {} +
  chown -R root:root "$pkgdir/usr"
}
