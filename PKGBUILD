# Maintainer: Faustino Aguilar <faustinoaq.github.io>
pkgname=amber
pkgver=0.3.5
pkgrel=1
pkgdesc="An open source efficient, cohesive and fun web framework for the Crystal language"
arch=(i686 x86_64)
url='https://github.com/amberframework/amber'
license=(MIT)
depends=('crystal' 'shards' 'sqlite')
source=("https://github.com/amberframework/amber/archive/v$pkgver.tar.gz")
sha256sums=('5bc48be991083b3d5d41ed7630a6ec29163d2bab4b29f74979ce495a30888fe1')

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
