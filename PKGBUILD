# Maintainer: Mario Finelli <mario dot finelli at yahoo dot com>

_npmname=autoprefixer
pkgname=nodejs-$_npmname
pkgver=5.2.0
pkgrel=1
pkgdesc="Parse CSS and add vendor prefixes to rules by Can I Use"
arch=('any')
url="https://github.com/postcss/autoprefixer"
license=('MIT')
depends=('nodejs' 'npm')
source=(https://registry.npmjs.org/$_npmname/-/$_npmname-$pkgver.tgz)
noextract=($_npmname-$pkgver.tgz)
sha256sums=('77c39fce9529f48a921a061711e0ec91ac9bd23626069313d7794b5a05498fcb')

package() {
  cd "$srcdir"
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p "$_npmdir"
  cd "$_npmdir"
  npm install --user root -g --prefix "$pkgdir/usr" $_npmname@$pkgver
}
