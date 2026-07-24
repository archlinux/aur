# Maintainer: Nikita Goncharov <ininids@ininids.in.rs>
pkgname=nothypridle-bin
pkgver=0.2.0
pkgrel=1
pkgdesc="A Wayland idle management daemon written in Rust"
arch=('x86_64')
url="https://github.com/ininids/nothypridle"
license=('BSD-3-Clause')
options=(!debug)
depends=('wayland')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/ininids/nothypridle/releases/download/v0.2.0/nothypridle-0.2.0-x86_64-unknown-linux-gnu.tar.gz")
sha256sums=('aaf9947038c794c1b29350c6d4481d94a18042168e8403e51b2fbde9ca0c02e0')
package() {
  cd "${srcdir}"
  tar xzf "${pkgname}-${pkgver}.tar.gz"
  find . -name nothypridle -type f -exec install -Dm755 {} "${pkgdir}/usr/bin/nothypridle" \;
}
