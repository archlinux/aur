# Maintainer: Mario Finelli <mario at finel dot li>

_npmname=autoprefixer
pkgname=nodejs-$_npmname
pkgver=9.4.0
pkgrel=1
pkgdesc="Parse CSS and add vendor prefixes to rules by Can I Use."
arch=('any')
url="https://github.com/postcss/autoprefixer"
license=('MIT')
depends=('nodejs')
makedepends=(npm)
source=(https://registry.npmjs.org/$_npmname/-/$_npmname-$pkgver.tgz)
noextract=($_npmname-$pkgver.tgz)
sha256sums=('46f5dac603e94f2c59136ec39719729dc86b7285a57cff1c0abd76d89d064012')

package() {
  npm install \
    --user root --global \
    --prefix "$pkgdir/usr" \
    "$srcdir"/$_npmname-$pkgver.tgz

  find "$pkgdir/usr" -type d -exec chmod 755 '{}' +

  install -Dm0644 "$pkgdir/usr/lib/node_modules/$_npmname/LICENSE" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
