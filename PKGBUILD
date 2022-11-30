# Maintainer: Morteza NourelahiAlamdari <m@0t1.me>

pkgname=tctl
pkgver=1.17.2
pkgrel=1
pkgdesc="Temporal CLI"
arch=('x86_64')
url="https://github.com/temporalio/tctl/"
license=('MIT')
makedepends=('go' 'make')
source=("$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('ad887002f36d67a03739d08b098c474f4120008207316c987741395ce0b30889')

build() {
  cd "$pkgname-$pkgver"
  make build
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 'tctl' "${pkgdir}/usr/local/bin/${pkgname}"
  install -Dvm644 'LICENSE' -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dvm644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
}
