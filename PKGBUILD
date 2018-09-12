# Author: Lukas Grossar <lukas.grossar@gmail.com
# Maintainer: Lukas Grossar <lukas.grossar@gmail.com
_npmname=commitizen
_npmver=2.10.1
pkgname=nodejs-commitizen
pkgver=2.10.1
pkgrel=1
pkgdesc="Git plugin to help you write consistent commit messages"
arch=(any)
url="https://github.com/commitizen/cz-cli"
license=(MIT)
depends=('nodejs' 'npm')
optdepends=()
source=(http://registry.npmjs.org/$_npmname/-/$_npmname-$_npmver.tgz)
noextract=($_npmname-$_npmver.tgz)
sha512sums=("b6e29747c220acd458f8cf580c42ffd7cd63f9b4c689c58d7ad616dc41030d5a823cf3243b21e47a7f1f31648ba0e8ad36d51f9499ceb538f929f242a31da42b")

package() {
  cd "$srcdir"
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p $_npmdir
  cd $_npmdir
  npm install -g --prefix "$pkgdir/usr" $_npmname@$_npmver
}

# vim:set ts=2 sw=2 et:<Paste>
