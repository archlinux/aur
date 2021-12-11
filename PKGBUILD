# Maintainer: Benjamin Levy <blevy@protonmail.com>
pkgname=unf
pkgver=2.1.4
pkgrel=2
makedepends=('rust' 'cargo')
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
pkgdesc="UNixize Filename -- replace annoying anti-unix characters in filenames"
license=('MIT')
url="https://github.com/io12/unf"
source=("https://github.com/io12/${pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('90022fcf2f57de519ed5fc9ad6a1f69cdb32374c86ac3d5a2d3afc63dcc9e046')

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
