# Maintainer: Mario Finelli <mario at finel dot li>
# Contributor: Taylon Silva <taylonsilva@gmail.com>
# Contributor: Andy Weidenbaum <archbaum@gmail.com>

pkgname=nodejs-n
pkgver=8.2.0
pkgrel=1
pkgdesc="Node version management"
arch=(any)
depends=(bash)
url=https://github.com/tj/n
license=(MIT)
install=$pkgname.install
source=(https://github.com/tj/n/archive/v$pkgver/n-$pkgver.tar.gz)
sha256sums=('75efd9e583836f3e6cc6d793df1501462fdceeb3460d5a2dbba99993997383b9')

package() {
  cd n-$pkgver

  PREFIX="$pkgdir/usr" make install

  install -Dm0644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm0644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm0644 CHANGELOG.md "$pkgdir/usr/share/doc/$pkgname/CHANGELOG.md"
}
