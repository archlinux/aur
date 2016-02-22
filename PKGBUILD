# Maintainer: Morten Linderud <morten@linderud.pw>
_npmname=how2
_npmver=1.0.5
pkgname=nodejs-how2
pkgver=1.0.5
pkgrel=1
pkgdesc="how2 finds the simplest way to do something in a unix shell. It's like man, but you can query it in natural language:"
arch=(any)
url="https://github.com/santinic/how2"
license=(MIT)
depends=('nodejs' 'npm')
optdepends=()
source=(http://registry.npmjs.org/$_npmname/-/$_npmname-$_npmver.tgz)
noextract=($_npmname-$_npmver.tgz)
sha256sums=('910db8b8c647b9bcc5d21822fbd2491c66179997560a9601d8ebb07c32cc2a2e')


package() {
  cd "$srcdir"
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p "$_npmdir"
  cd "$_npmdir"
  npm install -g --prefix "$pkgdir/usr" $_npmname@$_npmver
}
