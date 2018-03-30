# Maintainer: Faustino Aguilar <faustinoaq.github.io>
pkgname=amber
pkgver=0.7.1
pkgrel=1
pkgdesc="An open source efficient, cohesive and fun web framework for the Crystal language"
arch=(i686 x86_64)
url='https://github.com/amberframework/amber'
license=(MIT)
depends=('crystal' 'shards' 'sqlite')
source=("https://github.com/amberframework/amber/archive/v$pkgver.tar.gz")
sha256sums=('7775e23eba9f18d38099871ff9c8ad78d32f600213d0a72141d1e0ca3c708107')

build() {
  cd "amber-$pkgver"
  shards --production
  make build
}

package() {
  cd "amber-$pkgver"
  install -Dm755 bin/amber "$pkgdir/usr/bin/amber"
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/amber/LICENSE
}
