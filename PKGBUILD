# Maintainer: Faustino Aguilar <faustinoaq.github.io>
pkgname=amber
pkgver=0.2.2
pkgrel=1
pkgdesc="An open source efficient, cohesive and fun web framework for the Crystal language "
arch=(i686 x86_64)
url='https://github.com/amber-crystal/amber'
license=(MIT)
depends=('crystal' 'shards' 'sqlite')
source=("https://github.com/amber-crystal/amber/archive/v$pkgver.tar.gz")
sha256sums=('4d41dcbcee2f8cf696a3039bad712d344ad4e5f1c8c21df0214067cd7de047ba')

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
