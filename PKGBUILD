# Maintainer: Gobidev <adrian[dot]groh[at]t-online[dot]de>
# Contributor: Hao Long <aur@esd.cc>

pkgname=rustscan
_pkgname=RustScan
pkgver=2.1.0
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
sha256sums=('10958957148544da780c1be4004b906e94bafe02a19f0224f6026828fb77a8cc')
build() {
  cd ${_pkgname}-${pkgver}
  cargo build --release --offline --all-features --target-dir=target
}

package() {
  cd ${_pkgname}-${pkgver}
  install -Dm755 target/release/${pkgname} ${pkgdir}/usr/bin/${pkgname}
}
