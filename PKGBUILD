# Maintainer: Nikita Almakov <nikita.almakov@gmail.com>

pkgname=rate-arch-mirrors
pkgver=0.2.0
pkgrel=1
pkgdesc="Everyday-use client-side map-aware arch mirror ranking tool"
url="https://github.com/westandskif/rate-arch-mirrors"
license=('custom')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/westandskif/${pkgname}/archive/v${pkgver}.tar.gz")
arch=('x86_64')
depends=('gcc-libs')
makedepends=('cargo')
sha512sums=('48c09f8027608453b875ad768b819976cbe7b4c69f9335c6552c87e3b46e810abb28c913a16630fb87b7456ed84b7e52601cac0c91309f27832b520045195be9')

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
