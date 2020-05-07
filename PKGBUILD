# Maintainer: ObserverOfTime <chronobserver@disroot.org>

pkgname=stylelint-scss
pkgver=3.17.2
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
sha256sums=('d454057b5be240e410e0dc281a4cacbd8556e7ead0c1e90e594c0599671ea8dd')

package() {
  npm install -g --prefix "$pkgdir/usr" "$srcdir/$pkgname-$pkgver.tgz"

  # Fix directory permissions
  find "$pkgdir/usr" -type d -exec chmod 755 {} +

  install -Dm644 \
    "$pkgdir/usr/lib/node_modules/$pkgname/LICENSE" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
