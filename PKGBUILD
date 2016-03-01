# Maintainer: Morten Linderud <morten@linderud.pw>
_npmname=how2
pkgname=nodejs-how2
pkgver=1.0.9
pkgrel=1
pkgdesc="how2 finds the simplest way to do something in a unix shell. It's like man, but you can query it in natural language:"
arch=(any)
url="https://github.com/santinic/how2"
license=(MIT)
depends=('nodejs' 'npm')
optdepends=()
source=(http://registry.npmjs.org/$_npmname/-/$_npmname-$pkgver.tgz)
noextract=($_npmname-$pkgver.tgz)
sha256sums=('0b8717606540d5fbb025e3cd3ceecf10ed96184a6fadb7b598a909fa7f8397fb')


package() {
  cd "$srcdir"
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p "$_npmdir"
  cd "$_npmdir"
  npm install -g --prefix "$pkgdir/usr" $_npmname@$pkgver
}
