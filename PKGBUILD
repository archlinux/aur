# Maintainer: Mario Finelli <mario at finel dot li>

_npmname=autoprefixer
pkgname=nodejs-$_npmname
pkgver=9.3.1
pkgrel=1
pkgdesc="Parse CSS and add vendor prefixes to rules by Can I Use."
arch=('any')
url="https://github.com/postcss/autoprefixer"
license=('MIT')
depends=('nodejs')
makedepends=(npm)
source=(https://registry.npmjs.org/$_npmname/-/$_npmname-$pkgver.tgz)
noextract=($_npmname-$pkgver.tgz)
sha256sums=('e184d2f7938c922c6a8af41f9ded2be38c9a2e681eb22ea63dd8bef432e8fbd6')

package() {
  npm install \
    --user root --global \
    --prefix "$pkgdir/usr" \
    "$srcdir"/$_npmname-$pkgver.tgz

  find "$pkgdir/usr" -type d -exec chmod 755 '{}' +

  install -Dm0644 "$pkgdir/usr/lib/node_modules/$_npmname/LICENSE" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
