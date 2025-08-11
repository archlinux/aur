# Maintainer: Luke Wilkinson <wilkinsonluke@proton.me>

pkgname=fmp-git
pkgver=1.4.3
pkgrel=1
pkgdesc="A simple secure password manager written in rust."
arch=('x86_64')
url="https://github.com/lwilk0/fmp"
license=('GPL-3.0')
depends=('gpgme' 'libgpg-error')
makedepends=('cargo')
source=("fmp-$pkgver.tar.gz::https://github.com/lwilk0/fmp/archive/refs/tags/v$pkgver.tar.gz")
sha512sums=('71204b64c8e904628b4c73a1bc3ab6e537337bd131b70f6c4e8cb0e832444d1be82f184677189fbaa399e2382c8214731d52450b1dc5ba4b4a323e9d56121d66')

build() {
  cd "fmp-$pkgver"

  cargo build --release
}

package() {
  cd "fmp-$pkgver"

  install -Dm755 "target/release/fmp" "$pkgdir/usr/bin/fmp"

  install -Dm644 "README.md" "$pkgdir/usr/share/doc/${pkgname}/README.md"
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
}
