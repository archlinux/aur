# Maintainer: Morteza NourelahiAlamdari <m@0t1.me>

pkgname=tctl
pkgver=1.18.0
pkgrel=1
pkgdesc="Temporal CLI"
arch=('x86_64')
url="https://github.com/temporalio/tctl/"
license=('MIT')
makedepends=('go' 'make')
source=("$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('46d9bcd8c011205b81f4564023267638ddc1be64a28c61d5c531d0c60af1ad43')

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
