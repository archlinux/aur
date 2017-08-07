pkgname=netclix
pkgver=0.2.6
pkgrel=1
pkgdesc="A simple cli tool to get movie streaming link."
arch=('any')
url="https://github.com/stoneo/netclix"
license=('MIT')
depends=('nodejs')
makedepends=('npm')
source=("https://registry.npmjs.org/$pkgname/-/$pkgname-$pkgver.tgz")
noextract=($pkgname-$pkgver.tgz)
sha1sums=('89840b3efda54efa5655376290f69c2e9a323e17')

package() {
  npm install -g --user root --prefix "$pkgdir"/usr "$srcdir"/$pkgname-$pkgver.tgz
  rm -r "$pkgdir"/usr/etc
  mkdir -p "$pkgdir/usr/share/licenses/$pkgname"
  ln -s "../../../lib/node_modules/$pkgname/LICENSE*" "$pkgdir/usr/share/licenses/$pkgname/"
}

