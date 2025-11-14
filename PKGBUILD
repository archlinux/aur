# Maintainer: Griffin Evans <griffinevans@protonmail.com>

pkgname=adv
pkgver=1.1.0
pkgrel=1
pkgdesc="Dispenses programming aphorisms in the style of UNIX fortune"
arch=('any')
url="https://github.com/griffinevans/adv"
license=('Unlicense')
makedepends=('cargo')
conflicts=('adv')
provides=('adv')
source=("$pkgname-$pkgver.tar.gz::https://github.com/griffinevans/adv/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('8006386147536ca8109e5b3ab2164166326685c29ac8779cec067b2cbed0ef05')

build() {
  cd "${pkgname}-${pkgver}"
  cargo build --release --locked
}

package() {
  cd "${pkgname}-${pkgver}"

  install -Dm755 "target/release/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
}
