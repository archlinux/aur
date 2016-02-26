# Maintainer: Morten Linderud <morten@linderud.pw>
_npmname=how2
_npmver=1.0.8
pkgname=nodejs-how2
pkgver=1.0.8
pkgrel=2
pkgdesc="how2 finds the simplest way to do something in a unix shell. It's like man, but you can query it in natural language:"
arch=(any)
url="https://github.com/santinic/how2"
license=(MIT)
depends=('nodejs' 'npm')
optdepends=()
source=(http://registry.npmjs.org/$_npmname/-/$_npmname-$_npmver.tgz)
noextract=($_npmname-$_npmver.tgz)
sha256sums=('1b2a2c6044ee68b82a0f075a1ba6aea7af3b47bfab165734f6e51f9a897f0490')


package() {
  cd "$srcdir"
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p "$_npmdir"
  cd "$_npmdir"
  npm install -g --prefix "$pkgdir/usr" $_npmname@$_npmver
}
