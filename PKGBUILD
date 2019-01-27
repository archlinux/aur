# Maintainer: Pierre Schmitz <pierre@archlinux.de>

_npmname=sharp-cli
pkgname=nodejs-sharp-cli
pkgver=1.9.0
pkgrel=1
pkgdesc='CLI for sharp'
arch=('x86_64')
url='https://github.com/vseventer/sharp-cli'
license=('MIT')
depends=('nodejs' 'expat' 'libcroco')
makedepends=('npm')
source=("https://registry.npmjs.org/$_npmname/-/$_npmname-$pkgver.tgz")
noextract=("$_npmname-$pkgver.tgz")
sha256sums=('a64528a0733f3ba53bbb97d86c9de201fad6f69f51a949a2f92b583f85006996')

package() {
  cd $srcdir
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p $_npmdir
  cd $_npmdir
  npm install -g --prefix "$pkgdir/usr" $_npmname@$pkgver
  find "$pkgdir/usr" -type d -exec chmod 755 {} +
  chown -R root:root "$pkgdir/usr"
}
