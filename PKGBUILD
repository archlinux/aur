# Maintainer: Hao Long <aur@esd.cc>

pkgname=rustscan
_pkgname=RustScan
pkgver=1.4.0
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
sha256sums=('812c2e8577499c73ff6d1bc909ed68d0a307a04fbc99a8c075962c9e98efffab')

build() {
  cd ${_pkgname}-${pkgver}
  cargo build --release --locked --all-features --target-dir=target
}

package() {
  cd ${_pkgname}-${pkgver}
  install -Dm755 target/release/${pkgname} ${pkgdir}/usr/bin/${pkgname}
}
