# Maintainer Joe Maples <joe@maples.dev>
pkgname=scxctl
pkgver=0.3.0
pkgrel=1
pkgdesc="A CLI interface for scx_loader"
url="https://github.com/frap129/scxctl"
arch=('any')
license=('Apache 2.0 or MIT')
makedepends=('cargo')
depends=('scx-scheds')
source=("https://github.com/frap129/scxctl/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('dde7b4b4e2f128b9326e38fe1f8cf6505bbfebf7113dc5c4504e738ebbdf68fd')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  cargo build --release
}

package() {
  install -Dm755 "${srcdir}/${pkgname}-${pkgver}/target/release/scxctl" "${pkgdir}/usr/bin/scxctl"
}
