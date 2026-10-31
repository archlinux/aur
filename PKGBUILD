# Maintainer: lunainvictum (solisinvictum on GitHub) https://github.com/solisinvictum/borgrestore
pkgname=borgrestore
pkgver=0.4
pkgrel=1
pkgdesc="Puts the system in exactly the same state as it is in a Borg snapshot"
arch=('any')
url="https://github.com/solisinvictum/borgrestore"
license=('GPL-3.0-only')
depends=('bash' 'borg' 'python-pyfuse3' 'rsync' 'util-linux')
optdepends=('vorta: a nice Borg GUI')
backup=('etc/borgrestore/borgrestore.conf')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('f1b334db3842e8f2830036f48e0c150ca142c38c7308960596558036966aff7d')

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 borgrestore "$pkgdir/usr/bin/borgrestore"
  install -Dm644 borgrestore.conf "$pkgdir/etc/borgrestore/borgrestore.conf"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
