
# Maintainer: Stijn Seghers <stijnseghers at gmail dot com>

pkgname=stylelint-config-standard
pkgver=17.0.0
pkgrel=1
pkgdesc='The standard shareable config for stylelint'
arch=('any')
url='https://github.com/stylelint/stylelint-config-standard'
license=('MIT')
depends=('nodejs' 'stylelint')
makedepends=('npm')
source=("http://registry.npmjs.org/$pkgname/-/$pkgname-$pkgver.tgz")
noextract=("$pkgname-$pkgver.tgz")
sha512sums=('576940e40d0811c601ddbc488c273e0c37ad97617f7a779f0197c256be2a30767f0a7b3df07f942a34035c1965f168262bf4be0025496d48c0ec5c98fd349e63')

package() {
  npm install -g --user root --prefix "$pkgdir/usr" "$srcdir/$pkgname-$pkgver.tgz"

  rm -r "$pkgdir/usr/etc"

  install -d "$pkgdir/usr/share/licenses/$pkgname"
  ln -s "../../../lib/node_modules/$pkgname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
