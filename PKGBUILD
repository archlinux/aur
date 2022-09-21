# Maintainer: Marko Korhonen <aur@marko.korhonen.cc>

pkgname=yj
pkgver=5.1.0
pkgrel=2
pkgdesc="Convert YAML <=> TOML <=> JSON <=> HCL"
url="https://github.com/sclevine/yj"
depends=()
makedepends=('go')
provides=('yj')
conflicts=('yj')
license=('APACHE')
arch=('x86_64')
source=("yj-$pkgver.tar.gz::https://github.com/sclevine/yj/archive/refs/tags/v$pkgver.tar.gz")
md5sums=('f6ab69c49db27ced1bbb0031ea92936e')

build() {
  cd "$srcdir/yj-$pkgver"
  go mod download
  go build -ldflags "-X main.Version=$pkgver"
}

package() {
  cd "$srcdir/yj-$pkgver"
  install -D -m755 ${pkgname} "${pkgdir}/usr/bin/${pkgname}"
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
