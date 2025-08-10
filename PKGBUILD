# Maintainer: Alexander F. Rødseth <xyproto@archlinux.org>

pkgname=wurl
pkgver=1.0.0
pkgrel=1
pkgdesc='Utility for fetching URIs with libcurl and a drop-in replacement for wget (for the most common flags)'
arch=(x86_64)
url='https://github.com/xyproto/wurl'
license=(MIT)
provides=(wget)
conflicts=(wget)
source=("$url/releases/download/v$pkgver/$pkgname-$pkgver.tar.gz")
b2sums=('16e69de58fa48c7ff773cb684e7c489eff1107a449dc791783dc4a106dd1c24c722f3e0a94886cf110ad191f31bbe0a21d98a74219f713c2dade6921f7cc55a5')

build() {
  make -C $pkgname-$pkgver
}

package() {
  cd $pkgname-$pkgver
  make install PREFIX="$pkgdir/usr"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
