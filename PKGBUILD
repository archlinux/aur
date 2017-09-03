# Maintainer: Morten Linderud <morten@linderud.pw>
_npmname=how2
pkgname=nodejs-how2
pkgver=1.1.0
pkgrel=2
pkgdesc="how2 finds the simplest way to do something in a unix shell. It's like man, but you can query it in natural language:"
arch=(any)
url="https://github.com/santinic/how2"
license=(MIT)
depends=('nodejs' 'npm')
optdepends=()
source=(http://registry.npmjs.org/$_npmname/-/$_npmname-$pkgver.tgz)
noextract=($_npmname-$pkgver.tgz)
sha256sums=('96adf72bfa307c5413314afb547179e781f9ef18db6c7233b104da399657478e')


package() {
  cd "$srcdir"
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p "$_npmdir"
  cd "$_npmdir"
  npm install -g --prefix "$pkgdir/usr" $_npmname@$pkgver
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
