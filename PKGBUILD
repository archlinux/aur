# Maintainer: Mario Finelli <mario at finel dot li>
# Contributor: Taylon Silva <taylonsilva@gmail.com>
# Contributor: Andy Weidenbaum <archbaum@gmail.com>

pkgname=nodejs-n
pkgver=9.2.1
pkgrel=1
pkgdesc="Node version management"
arch=(any)
depends=(bash)
url=https://github.com/tj/n
license=(MIT)
install=$pkgname.install
source=(https://github.com/tj/n/archive/v$pkgver/n-$pkgver.tar.gz)
sha256sums=('f112c291a1f441a14971ce5ee5dfb5f0a5d4251bd5f3ec556ef1c5a0687e3ee6')

package() {
  cd n-$pkgver

  PREFIX="$pkgdir/usr" make install

  install -Dm0644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm0644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm0644 CHANGELOG.md "$pkgdir/usr/share/doc/$pkgname/CHANGELOG.md"
}
