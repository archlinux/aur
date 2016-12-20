# Maintainer: Mario Finelli <mario dot finelli at yahoo dot com>

_npmname=autoprefixer
pkgname=nodejs-$_npmname
pkgver=6.5.4
pkgrel=1
pkgdesc="Parse CSS and add vendor prefixes to rules by Can I Use"
arch=('any')
url="https://github.com/postcss/autoprefixer"
license=('MIT')
depends=('nodejs' 'npm')
source=(https://registry.npmjs.org/$_npmname/-/$_npmname-$pkgver.tgz)
noextract=($_npmname-$pkgver.tgz)
sha256sums=('d9a47ee78d836f4fd00c780810be6c96286a75f5cf5e37eca4cc49154e3791d3')

package() {
  cd "$srcdir"
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p "$_npmdir"
  cd "$_npmdir"
  npm install --user root -g --prefix "$pkgdir/usr" $_npmname@$pkgver
}
