# Maintainer: AmaseCocoa <cocoa@amase.cc>
pkgname=alter
pkgver=0.1.0
pkgrel=1
pkgdesc="An "Alternative" account switcher."
arch=("x86_64")
url="https://github.com/AmaseCocoa/alter"
license=('MIT')
depends=('glibc')
makedepends=('rust' 'cargo')
source=("$pkgname-$pkgver.tar.gz::https://github.com/AmaseCocoa/$pkgname/archive/refs/tags/$pkgver.tar.gz")
sha256sums=("aa75d4416eb479a2faa0ee9cdb85b51912b4aad4928a38e06ee37036dd108aed")


build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  cargo build --release
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  install -Dm755 "target/release/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
}
