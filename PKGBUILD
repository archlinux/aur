# Maintainer: Nikita Almakov <nikita.almakov@gmail.com>

pkgname=rate-mirrors
pkgver=0.4.0
pkgrel=1
pkgdesc="Everyday-use client-side map-aware mirror ranking tool (arch, manjaro, custom)"
url="https://github.com/westandskif/rate-mirrors"
license=('custom')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/westandskif/${pkgname}/archive/v${pkgver}.tar.gz")
arch=('x86_64')
depends=('gcc-libs')
makedepends=('cargo')
sha512sums=('3050fd484b7789bdbebb770e08a01edea03a54073e8ce27ba7b46e1515f928c7f61797a15baa22be648c2e88299f68c44ecb24b0f6f78399c7e48241d6973d98')

build() {
  cd "$pkgname-$pkgver"

  cargo build --release --locked
}

package() {
  cd "$pkgname-$pkgver"

  install -Dm755 "target/release/rate_mirrors" "$pkgdir/usr/bin/${pkgname}"
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
}

#vim: syntax=sh
