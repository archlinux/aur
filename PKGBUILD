# Maintainer: ObserverOfTime <chronobserver@disroot.org>

pkgname=stylelint-scss
pkgver=3.15.0
pkgrel=1
pkgdesc='A collection of SCSS specific linting rules for stylelint'
arch=('any')
url='https://github.com/kristerkari/stylelint-scss'
license=('MIT')
depends=()
makedepends=('npm')
optdepends=('stylelint: peer dependency')
source=("https://registry.npmjs.org/$pkgname/-/$pkgname-$pkgver.tgz")
noextract=("$pkgname-$pkgver.tgz")
sha256sums=('f1c2dfed177487ed0b8def15413ca40f274cd6e35691b97702e7cb2277c4aa60')

package() {
  npm install -g --prefix "$pkgdir/usr" "$srcdir/$pkgname-$pkgver.tgz"

  # Fix directory permissions
  find "$pkgdir/usr" -type d -exec chmod 755 {} +

  install -Dm644 \
    "$pkgdir/usr/lib/node_modules/$pkgname/LICENSE" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
