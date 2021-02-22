# Maintainer: lmartinez-mirror <lmartinez-mirror at noreply dot github dot com>
pkgname=baru
pkgver=0.2.5
pkgrel=2
pkgdesc='A system monitor written in Rust and C'
arch=('x86_64')
url='https://github.com/doums/baru'
license=('MPL2')
depends=('libnl' 'libpulse')
makedepends=('git' 'rust' 'cmake')
conflicts=('baru-bin')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('fb8cabb64ecdf0d6aaa7335543f6804eb30d12f3c21409fbbf390dfc2c56eeb0c1c9da8c9cdc3d221bd406d876431243dafa8da3da17a86fb81deae3adf86308')

build() {
  cd "$pkgname-$pkgver"
  cargo build --release --locked
}

package() {
  install -Dm 755 "$pkgname-$pkgver/target/release/$pkgname" -t "$pkgdir/usr/bin/"
}

