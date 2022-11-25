# Maintainer: Morteza NourelahiAlamdari <m@0t1.me>

pkgname=tctl
pkgver=1.17.1
pkgrel=1
pkgdesc="Temporal CLI"
arch=('x86_64')
url="https://github.com/temporalio/tctl/"
license=('MIT')
makedepends=('go' 'make')
source=("$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('1450e53574bb0e19261683f036d9d5bde9db8e430c058883376d37de10797a45')

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
