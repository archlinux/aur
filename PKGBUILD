# Maintainer: AmaseCocoa <cocoa@amase.cc>
pkgname=alter
pkgver=0.2.0
pkgrel=1
pkgdesc="Switch git username and email and credential in one-line."
arch=("x86_64")
url="https://github.com/AmaseCocoa/alter"
license=('MIT')
depends=('glibc')
makedepends=('rust' 'cargo')
source=("$pkgname-v$pkgver.tar.gz::https://github.com/AmaseCocoa/$pkgname/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=("0206555f2e5ff3a4bac2eebaae3604beffe597bfa731f8bee5bf4251dada5fc7")


build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  cargo build --release
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  install -Dm755 "target/release/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
}
