# Maintainer: Your Name <me (at) aligator (dot) dev>
pkgname=framework-hz
pkgver=1.0.0
pkgrel=1
pkgdesc="A bash script to change the framework 16 laptop screen refresh rate on KDE"
arch=('any')
url="https://github.com/aligator/framework-hz"
license=('MIT')
depends=('jq' 'kscreen')
source=("$pkgname-$pkgver.tar.gz::https://github.com/aligator/framework-hz/archive/refs/tags/v1.0.0.tar.gz")
sha256sums=('d76fbce1e2152025a0ca657464d45e573250c265e34d497cc40a288d0dd2203d')

package() {
  cd "$srcdir/framework-hz-1.0.0"
  
  # Install the scripts into /usr/bin
  install -Dm755 hz.sh "$pkgdir/usr/bin/hz"
  install -Dm755 hz60.sh "$pkgdir/usr/bin/hz60"
  install -Dm755 hz165.sh "$pkgdir/usr/bin/hz165"
  
  # Install documentation
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
