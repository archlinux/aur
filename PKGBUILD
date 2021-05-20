# Maintainer: Nikita Almakov <nikita.almakov@gmail.com>

pkgname=rate-arch-mirrors
pkgver=0.3.0
pkgrel=1
pkgdesc="Everyday-use client-side map-aware arch mirror ranking tool"
url="https://github.com/westandskif/rate-arch-mirrors"
license=('custom')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/westandskif/${pkgname}/archive/v${pkgver}.tar.gz")
arch=('x86_64')
depends=('gcc-libs')
makedepends=('cargo')
sha512sums=('3bc7e85f865bc08b6fe3367f6f20b9854dfaa7377260ee0af49568a39c62b4f0ceb0886154b47a5c85d5d8fdf17c57d62029a4fd3cb6f0c20729e8ef14fafe54')

build() {
  cd "$pkgname-$pkgver"

  cargo build --release --locked
}

package() {
  cd "$pkgname-$pkgver"

  install -Dm755 "target/release/rate_arch_mirrors" "$pkgdir/usr/bin/${pkgname}"
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
}

#vim: syntax=sh
