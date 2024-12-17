# Maintainer Joe Maples <joe@maples.dev>
pkgname=scxctl
pkgver=0.2.1
pkgrel=1
pkgdesc="A CLI interface for scx_loader"
url="https://github.com/frap129/scxctl"
arch=('any')
license=('Apache 2.0 or MIT')
makedepends=('cargo')
depends=('scx-scheds')
source=("https://github.com/frap129/scxctl/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('d1659193303f8b72916cfd137ca429497aec93a31afe9225e95467e137f29c7a')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  cargo build --release
}

package() {
  install -Dm755 "${srcdir}/${pkgname}-${pkgver}/target/release/scxctl" "${pkgdir}/usr/bin/scxctl"
}
