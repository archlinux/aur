pkgname=netclix
pkgver=0.2.5
pkgrel=1
pkgdesc="A simple cli tool to get movie streaming link."
arch=('any')
url="https://github.com/stoneo/netclix"
license=('MIT')
depends=('nodejs')
makedepends=('npm')
source=("https://registry.npmjs.org/$pkgname/-/$pkgname-$pkgver.tgz")
noextract=($pkgname-$pkgver.tgz)
sha1sums=('f18243bf644d9d4fe19c1f9b17e2819ad9b5209a')

package() {
  npm install -g --user root --prefix "$pkgdir"/usr "$srcdir"/$pkgname-$pkgver.tgz
  rm -r "$pkgdir"/usr/etc
  mkdir -p "$pkgdir/usr/share/licenses/$pkgname"
  ln -s "../../../lib/node_modules/$pkgname/LICENSE*" "$pkgdir/usr/share/licenses/$pkgname/"
}

