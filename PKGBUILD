# Maintainer: Andrea Scarpino <andrea@archlinux.org>

pkgname=arch-audit
pkgver=0.1.2
pkgrel=1
pkgdesc='An utility like pkg-audit based on Arch CVE Monitoring Team data'
url='https://github.com/ilpianista/arch-audit'
makedepends=('cargo')
arch=('i686' 'x86_64')
license=('MIT')
source=("$pkgname-$pkgver.tar.gz::https://github.com/ilpianista/arch-audit/archive/$pkgver.tar.gz")
md5sums=('7f0115ebb9d3801aec5ff53c490ccf76')

build() {
  cd "$pkgname-$pkgver"
  cargo build --release
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 "target/release/${pkgname}" "$pkgdir/usr/bin/${pkgname}"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
