# Maintainer Joe Maples <joe@maples.dev>
pkgname=scxctl
pkgver=0.3.4
pkgrel=2
pkgdesc="A CLI interface for scx_loader"
url="https://github.com/frap129/scxctl"
arch=('x86_64')
license=('Apache 2.0 or MIT')
makedepends=('cargo')
depends=('scx-scheds<=1.0.10')
conflicts=('scx-scheds>1.0.10' 'scx-scheds-git')
source=("https://github.com/frap129/scxctl/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('b98b16cdd102a284f3931b2dcecfa90c11ec6444cabac9178da6ebd854ffd0a4')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  cargo build --release
}

package() {
  install -Dm755 "${srcdir}/${pkgname}-${pkgver}/target/release/scxctl" "${pkgdir}/usr/bin/scxctl"
}
