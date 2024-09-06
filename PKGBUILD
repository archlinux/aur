# Maintainer: Alexander F. Rødseth <xyproto@archlinux.org>

pkgname=wurl
pkgver=0.0.1
pkgrel=1
pkgdesc='Utility for fetching URIs with libcurl and a drop-in replacement for wget'
arch=(x86_64)
url='https://github.com/xyproto/wurl'
license=(MIT)
provides=(wget)
conflicts=(wget)
source=("$url/releases/download/v$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('cfaa06a83e1de7cd7fdd54f907297bd378ac5ec42d632498ee5a98c855efe6f2')

build() {
  make -C $pkgname-$pkgver
}

package() {
  cd $pkgname-$pkgver
  make install PREFIX="$pkgdir/usr"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
