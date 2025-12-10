# Maintainer: AmaseCocoa <cocoa@amase.cc>
pkgname=alter
pkgver=0.2.1
pkgrel=1
pkgdesc="Switch git username and email and credential in one-line."
arch=("x86_64")
url="https://github.com/AmaseCocoa/alter"
license=('MIT')
depends=('glibc')
makedepends=('rust' 'cargo')
source=("$pkgname-v$pkgver.tar.gz::https://github.com/AmaseCocoa/$pkgname/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=("b4a748ac6b44764e10d50d8fcc8d9e402c0c03a3148b79c079c675de67299a23")


build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  cargo build --release
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  install -Dm755 "target/release/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
}
