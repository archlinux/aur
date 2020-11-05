# Maintainer: Hao Long <aur@esd.cc>

pkgname=rustscan
_pkgname=RustScan
pkgver=2.0.0
pkgrel=1
pkgdesc="The Modern Port Scanner"
arch=("x86_64" "i686")
url="https://github.com/rustscan/RustScan"
license=("GPL3")
provides=('rustscan')
conflicts=('rustscan')
depends=("nmap")
makedepends=("cargo")
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz")
sha256sums=('94e1a825b0b063e3134d2dfb2b8a047b7527aa5a0ecd83b9627aee0dab1a55e0')

build() {
  cd ${_pkgname}-${pkgver}
  cargo build --release --locked --all-features --target-dir=target
}

package() {
  cd ${_pkgname}-${pkgver}
  install -Dm755 target/release/${pkgname} ${pkgdir}/usr/bin/${pkgname}
}
