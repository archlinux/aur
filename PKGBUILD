# Maintainer: Narthana Epa <narthana.epa@gmail.com>
# Contributor: Morteza NourelahiAlamdari <m@0t1.me>

pkgname=golines
pkgver=0.12.2
pkgrel=1
pkgdesc="A golang formatter that fixes long lines"
arch=('x86_64' 'aarch64')
url="https://github.com/segmentio/golines"
license=('MIT')
makedepends=('go' 'make')
source=("$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('6f3c462dc707b4441733dbcbef624c61cce829271db64bd994d43e50be95a211')

build() {
  cd "$pkgname-$pkgver"
  GOAMD64=v3 go build -o golines -trimpath .
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 'golines' "${pkgdir}/usr/bin/${pkgname}"
  install -Dvm644 'LICENSE' -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dvm644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
}
