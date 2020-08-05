# Maintainer: Hao Long <aur@esd.cc>

pkgname=rustscan
_pkgname=RustScan
pkgver=1.6.0
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
sha256sums=('a4ebe4b8eda88dd10d52d961578c95b5427cc34b3bf41e5df729a37122c68965')

build() {
  cd ${_pkgname}-${pkgver}
  cargo build --release --locked --all-features --target-dir=target
}

package() {
  cd ${_pkgname}-${pkgver}
  install -Dm755 target/release/${pkgname} ${pkgdir}/usr/bin/${pkgname}
}
