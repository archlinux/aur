# Maintainer: Hao Long <aur@esd.cc>

pkgname=rustscan
_pkgname=RustScan
pkgver=1.3
pkgrel=1
pkgdesc="Faster Nmap Scanning with Rust"
arch=("x86_64" "i686")
url="https://github.com/brandonskerritt/RustScan"
license=("GPL3")
provides=('rustscan')
conflicts=('rustscan')
depends=("nmap")
makedepends=("cargo")
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz")
sha256sums=('3bbaf188fa4014a57596c4d4f928b75bdf42c058220424ae46b94f3a36b61f81')

build() {
  cd ${_pkgname}-${pkgver}
  cargo build --release --locked --all-features --target-dir=target
}

package() {
  cd ${_pkgname}-${pkgver}
  install -Dm755 target/release/${pkgname} ${pkgdir}/usr/bin/${pkgname}
}
