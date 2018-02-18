
# Maintainer: Stijn Seghers <stijnseghers at gmail dot com>

pkgname=stylelint-config-standard
pkgver=18.0.0
pkgrel=1
pkgdesc='The standard shareable config for stylelint'
arch=('any')
url='https://github.com/stylelint/stylelint-config-standard'
license=('MIT')
depends=('nodejs' 'stylelint')
makedepends=('npm')
source=("https://registry.npmjs.org/$pkgname/-/$pkgname-$pkgver.tgz")
noextract=("$pkgname-$pkgver.tgz")
sha512sums=('0e7baba8ec790ae9b2bb060fbee36b0671352e775e98593297c19091e1e1d6420bd75d4ccc1227329709bcbfa12a852b1db671e7d8afba893eb107a4385f8c22')

package() {
  npm install -g --user root --prefix "$pkgdir/usr" "$srcdir/$pkgname-$pkgver.tgz"

  rm -r "$pkgdir/usr/etc"

  install -d "$pkgdir/usr/share/licenses/$pkgname"
  ln -s "../../../lib/node_modules/$pkgname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
