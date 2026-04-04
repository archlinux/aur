# Maintainer: AmaseCocoa <cocoa@amase.cc>
pkgname=alter
pkgver=0.3.0
pkgrel=1
pkgdesc="Switch git username and email and credential in one-line."
arch=("x86_64")
url="https://github.com/AmaseCocoa/alter"
license=('MIT')
depends=('glibc')
makedepends=('rust' 'cargo')
source=("$pkgname-v$pkgver.tar.gz::https://github.com/AmaseCocoa/$pkgname/archive/refs/tags/v$pkgver.tar.gz")

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  cargo build --release
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  install -Dm755 "target/release/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
}

sha256sums=('baa89610da0c1072c45dcf35fd77c722478a68bca9593faeb6e512562e552fc2')
