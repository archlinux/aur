# Maintainer: Stijn Seghers <stijnseghers at gmail dot com>

pkgname=stylelint
pkgver=9.0.0
pkgrel=1
pkgdesc='A mighty, modern CSS linter that helps you enforce consistent conventions and avoid errors in your stylesheets'
arch=('any')
url='https://stylelint.io/'
license=('MIT')
depends=('nodejs')
optdepends=('stylelint-config-standard')
makedepends=('npm')
source=("https://registry.npmjs.org/$pkgname/-/$pkgname-$pkgver.tgz")
noextract=("$pkgname-$pkgver.tgz")
sha512sums=('49642d753dd10494b0fbcc4896d06b25f6982c8a85660ada1c08736f22a9fe5c81f84a5ba9f0fbb7188451ea2c54e1fa483d4c39f84558a811aee7b29a58c5b2')

package() {
  npm install -g --user root --prefix "$pkgdir/usr" "$srcdir/$pkgname-$pkgver.tgz"

  rm -r "$pkgdir/usr/etc"

  install -d "$pkgdir/usr/share/licenses/$pkgname"
  ln -s "../../../lib/node_modules/$pkgname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
