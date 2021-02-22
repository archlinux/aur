# Maintainer: Nikita Almakov <nikita.almakov@gmail.com>

pkgname=rate-arch-mirrors
pkgver=0.2.1
pkgrel=1
pkgdesc="Everyday-use client-side map-aware arch mirror ranking tool"
url="https://github.com/westandskif/rate-arch-mirrors"
license=('custom')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/westandskif/${pkgname}/archive/v${pkgver}.tar.gz")
arch=('x86_64')
depends=('gcc-libs')
makedepends=('cargo')
sha512sums=('be0e031d3441622fc0aa203b3a7bc2fcdffd7c86503d049d7bab5530904578b61ceaacd9f3094eeb7c7966059818eba2550d2afb35c3d4d9cab2d3bde48d904d')

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
