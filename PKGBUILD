# Maintainer: Faustino Aguilar <faustinoaq.github.io>
pkgname=amber
pkgver=0.2.3
pkgrel=1
pkgdesc="An open source efficient, cohesive and fun web framework for the Crystal language "
arch=(i686 x86_64)
url='https://github.com/amber-crystal/amber'
license=(MIT)
depends=('crystal' 'shards' 'sqlite')
source=("https://github.com/amber-crystal/amber/archive/v$pkgver.tar.gz")
sha256sums=('d808b6ec7807675069e563eea4aa27a64931e7cc324acbd33ae9cff38e275c86')

build() {
  cd "amber-$pkgver"
  shards
  make build
}

package() {
  cd "amber-$pkgver"
  install -Dm755 bin/amber "$pkgdir/usr/bin/amber"
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/amber/LICENSE
}
