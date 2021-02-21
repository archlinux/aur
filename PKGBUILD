# Maintainer: Nikita Almakov <nikita.almakov@gmail.com>

pkgname=rate-arch-mirrors-bin
pkgver=0.2.0
pkgrel=2
pkgdesc="Everyday-use client-side map-aware arch mirror ranking tool"
url="https://github.com/westandskif/rate-arch-mirrors"
license=('custom')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/westandskif/rate-arch-mirrors/releases/download/v${pkgver}/rate-arch-mirrors-v${pkgver}-x86_64-unknown-linux-gnu.tar.gz")
arch=('x86_64')
depends=('gcc-libs')
makedepends=('cargo')
conflicts=('rate-arch-mirrors')
sha512sums=('f8a489b88842d0d8861b6d994bedae93c285397b0587d6c492f83779d7d4df8328e16304afaf56976f825215079f54f9b799f767f3bccc070fb2348863de57ec')

build() {
  tar xzf "${pkgname}-${pkgver}.tar.gz"
}

package() {
  cd "rate-arch-mirrors-v${pkgver}-x86_64-unknown-linux-gnu"

  install -Dm755 "rate_arch_mirrors" "$pkgdir/usr/bin/${pkgname}"
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
}

#vim: syntax=sh
