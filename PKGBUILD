# Maintainer: Stijn Seghers <stijnseghers at gmail dot com>

pkgname=stylelint
pkgver=8.1.1
pkgrel=1
pkgdesc='A mighty, modern CSS linter that helps you enforce consistent conventions and avoid errors in your stylesheets'
arch=('any')
url='https://stylelint.io/'
license=('MIT')
depends=('nodejs')
optdepends=('stylelint-config-standard')
makedepends=('npm')
source=("http://registry.npmjs.org/$pkgname/-/$pkgname-$pkgver.tgz")
noextract=("$pkgname-$pkgver.tgz")
sha512sums=('46d8d4b6a1b687774fe02b8c53533ef864491af2975a8ce6bf9ca12e838bcbb3563f68c964ec0b652570b5c8d742c04905f1ae0b7de6a2804ec0d6822218b6b5')

package() {
  npm install -g --user root --prefix "$pkgdir/usr" "$srcdir/$pkgname-$pkgver.tgz"

  rm -r "$pkgdir/usr/etc"

  install -d "$pkgdir/usr/share/licenses/$pkgname"
  ln -s "../../../lib/node_modules/$pkgname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
