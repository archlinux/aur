# Maintainer: AmaseCocoa <cocoa@amase.cc>
pkgname=alter
pkgver=0.3.1
pkgrel=1
pkgdesc="Switch git username and email and credential in one-line."
arch=("x86_64")
url="https://github.com/AmaseCocoa/alter"
license=('MIT')
depends=('glibc' 'openssl')
makedepends=('rust' 'cargo' 'openssl')
source=("$pkgname-v$pkgver.tar.gz::https://github.com/AmaseCocoa/$pkgname/archive/refs/tags/v$pkgver.tar.gz")

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  cargo build --release
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  install -Dm755 "target/release/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
}

sha256sums=('b99a409837c883d03b35b10a200aca637feaeb58c6386525650902ef42cd5c72')
