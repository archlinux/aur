# Maintainer: Mario Finelli <mario at finel dot li>
# Contributor: Taylon Silva <taylonsilva@gmail.com>
# Contributor: Andy Weidenbaum <archbaum@gmail.com>

pkgname=nodejs-n
pkgver=9.0.0
pkgrel=1
pkgdesc="Node version management"
arch=(any)
depends=(bash)
url=https://github.com/tj/n
license=(MIT)
install=$pkgname.install
source=(https://github.com/tj/n/archive/v$pkgver/n-$pkgver.tar.gz)
sha256sums=('37a987230d1ed0392a83f9c02c1e535a524977c00c64a4adb771ab60237be1c6')

package() {
  cd n-$pkgver

  PREFIX="$pkgdir/usr" make install

  install -Dm0644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm0644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm0644 CHANGELOG.md "$pkgdir/usr/share/doc/$pkgname/CHANGELOG.md"
}
