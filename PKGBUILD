
# Maintainer: Stijn Seghers <stijnseghers at gmail dot com>

pkgname=stylelint-config-standard
pkgver=17.0.0
pkgrel=2
pkgdesc='The standard shareable config for stylelint'
arch=('any')
url='https://github.com/stylelint/stylelint-config-standard'
license=('MIT')
depends=('nodejs' 'stylelint')
makedepends=('npm')
source=("http://registry.npmjs.org/$pkgname/-/$pkgname-$pkgver.tgz")
noextract=("$pkgname-$pkgver.tgz")
sha512sums=('1bc8cc6742ac6951fb95ebabf572d9561c0e047676bdd6ee255f01832d2d6bbfcfa418441e8e9f8d50da35c8720865c1e6c45c595aba3bdac453f32f63d7100d')

package() {
  npm install -g --user root --prefix "$pkgdir/usr" "$srcdir/$pkgname-$pkgver.tgz"

  rm -r "$pkgdir/usr/etc"

  install -d "$pkgdir/usr/share/licenses/$pkgname"
  ln -s "../../../lib/node_modules/$pkgname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
