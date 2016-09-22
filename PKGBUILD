# Maintainer: Andrea Scarpino <andrea@archlinux.org>

pkgname=arch-audit
_cratename="${pkgname}-bin"
pkgver=0.1.0
pkgrel=1
pkgdesc='An utility like pkg-audit based on Arch CVE Monitoring Team data'
url='https://github.com/ilpianista/arch-audit'
makedepends=('cargo')
arch=('i686' 'x86_64')
license=('MIT')
source=("$_cratename-$pkgver.tar.gz::https://crates.io/api/v1/crates/$_cratename/$pkgver/download")
md5sums=('322f3b8bdc6bd03611ec1d64c324e274')

build() {
  cd "$_cratename-$pkgver"
  cargo build --release
}

package() {
  cd "$_cratename-$pkgver"
  install -Dm755 "target/release/${pkgname}" "$pkgdir/usr/bin/${pkgname}"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
