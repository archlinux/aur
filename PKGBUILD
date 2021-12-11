# Maintainer: Benjamin Levy <blevy@protonmail.com>
pkgname=unf
pkgver=2.1.4
pkgrel=1
makedepends=('rust' 'cargo')
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
pkgdesc="UNixize Filename -- replace annoying anti-unix characters in filenames"
license=('MIT')
url="https://github.com/io12/unf"
source=("https://github.com/io12/${pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('32d6c6863a9d4bf736bcc67f8d44170e7133f71528e02b52058885b00962322f')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  cargo build --release --locked
}

check() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  cargo test --release --locked
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  install -Dm 755 target/release/${pkgname} -t "${pkgdir}/usr/bin"
}
