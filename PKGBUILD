# Maintainer: Faustino Aguilar <faustinoaq.github.io>
pkgname=amber
pkgver=0.2.1
pkgrel=1
pkgdesc="Amber framework that makes interfacing with your file system and applications much smoother."
arch=(i686 x86_64)
url='https://github.com/amber-crystal/amber'
license=(MIT)
depends=('crystal' 'shards')
source=("https://github.com/amber-crystal/amber/archive/v$pkgver.tar.gz")
sha256sums=('b586ff61d0114bf0d463a429121d6e0b00ff7271baf540690c3d78239d653c56')

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
