# Maintainer Joe Maples <joe@maples.dev>
pkgname=scxctl
pkgver=0.2.0
pkgrel=1
pkgdesc="A CLI interface for scx_loader"
url="https://github.com/frap129/scxctl"
arch=('any')
license=('Apache 2.0 or MIT')
makedepends=('cargo')
source=("https://github.com/frap129/scxctl/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('3768963e780a6c25b746a06b38c3dbbbba1cf50dcdd67966551b947809964376')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  cargo build --release
}

package() {
  install -Dm755 "${srcdir}/${pkgname}-${pkgver}/target/release/scxctl" "${pkgdir}/usr/bin/scxctl"
}
