# Maintainer: Narthana Epa <narthana.epa@gmail.com>
# Contributor: Morteza NourelahiAlamdari <m@0t1.me>

pkgname=golines
pkgver=0.11.0
pkgrel=2
pkgdesc="A golang formatter that fixes long lines"
arch=('x86_64' 'aarch64')
url="https://github.com/segmentio/golines"
license=('MIT')
makedepends=('go' 'make')
source=("$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('d7336fbddb045bd2448629c4b8ef5ab2dc6136e71a795b6fdd596066bc00adc0')

build() {
  cd "$pkgname-$pkgver"
  make build
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 'golines' "${pkgdir}/usr/bin/${pkgname}"
  install -Dvm644 'LICENSE' -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dvm644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
}
