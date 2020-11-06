# Maintainer: Hao Long <aur@esd.cc>

pkgname=rustscan
_pkgname=RustScan
pkgver=2.0.1
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
sha256sums=('1d458cb081cbed2db38472ff33f9546a6640632148b4396bd12f0229ca9de7eb')
build() {
  cd ${_pkgname}-${pkgver}
  cargo build --release --locked --all-features --target-dir=target
}

package() {
  cd ${_pkgname}-${pkgver}
  install -Dm755 target/release/${pkgname} ${pkgdir}/usr/bin/${pkgname}
}
