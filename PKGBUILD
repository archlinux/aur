pkgname=faba-icon-theme
pkgver=4.3
pkgrel=1
pkgdesc="A sexy and modern icon theme with Tango influences."
arch=('any')
url="https://snwh.org/moka#faba-icon-theme"
license=('LGPL3' 'CCPL-4.0:by-sa')
depends=('gtk-update-icon-cache')
makedepends=('meson')
options=('!strip')
source=("$pkgname-$pkgver.tar.gz::https://github.com/moka-project/$pkgname/archive/v$pkgver.tar.gz")
md5sums=('34633c7d146b93abebc96d3dddd52053')
sha512sums=('eb86df4675d42c67a348466270640b93dde2a93304111a93205c7f1af06a677788d9f1a5bcacabdb60cc1ce9da4b49f29a3c5039109be40fc180cf4fea3f7d1b')

build() {
  cd "$pkgname-$pkgver"
  arch-meson . build
  ninja -C build
}

package() {
  cd "$pkgname-$pkgver"
  DESTDIR="$pkgdir" ninja -C build install
}
