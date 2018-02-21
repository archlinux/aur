# Maintainer: Mario Finelli <mario at finel dot li>

_npmname=autoprefixer
pkgname=nodejs-$_npmname
pkgver=8.0.0
pkgrel=1
pkgdesc="Parse CSS and add vendor prefixes to rules by Can I Use."
arch=('any')
url="https://github.com/postcss/autoprefixer"
license=('MIT')
depends=('nodejs' 'npm')
source=(https://registry.npmjs.org/$_npmname/-/$_npmname-$pkgver.tgz)
noextract=($_npmname-$pkgver.tgz)
sha256sums=('cdc66793a1d05ec5c804f9e5c3bee8f0da72d92c7c8a6f094a791aaa9055f3ed')

package() {
  cd "$srcdir"
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p "$_npmdir"
  cd "$_npmdir"
  npm install --user root -g --prefix "$pkgdir/usr" $_npmname@$pkgver
}
