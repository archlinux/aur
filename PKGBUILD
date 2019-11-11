# Maintainer: Faustino Aguilar <faustinoaq.github.io>
pkgname=amber
pkgver=0.31.0
pkgrel=1
pkgdesc="An open source efficient, cohesive and fun web framework for the Crystal language"
arch=(i686 x86_64)
url='https://github.com/amberframework/amber'
license=(MIT)
depends=('crystal' 'shards' 'sqlite')
source=("https://github.com/amberframework/amber/archive/v$pkgver.tar.gz")
sha256sums=('5875e6eab1dc995b855bc11a57226d6f87dcb3f651e563c9a49cf1a6dcbc8039')

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
