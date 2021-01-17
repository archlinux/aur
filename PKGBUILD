# Maintainer: Nikita Almakov <nikita.almakov@gmail.com>

pkgname=rate-arch-mirrors
pkgver=0.1.0
pkgrel=1
pkgdesc="A tool to filter out out-of-date Arch Linux mirrors and rate them"
url="https://github.com/westandskif/rate-arch-mirrors"
license=('custom')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/westandskif/${pkgname}/archive/v${pkgver}.tar.gz")
arch=('x86_64')
depends=('gcc-libs')
sha512sums=('37a6cb8de53a701b95ad90357e823b8907ddad7185798cfc2805efc4cd8faf2f76b8a4b06994c5960c08de18b33a1b9aaabc0a7cbda41dc3b212682804d1db55')

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
