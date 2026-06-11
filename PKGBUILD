# Maintainer: LightJunction <LIghtJUNction.me@gmail.com>

pkgname=obscura-browser-bin
pkgver=0.1.7
pkgrel=1
pkgdesc='The headless browser for AI agents and web scraping (binary release)'
arch=('x86_64' 'aarch64')
url='https://github.com/h4ckf0r0day/obscura'
license=('Apache-2.0')
depends=('gcc-libs' 'glibc')
provides=("obscura-browser=${pkgver}")
conflicts=('obscura-browser')
source=("LICENSE-${pkgver}::${url}/raw/v${pkgver}/LICENSE")
source_x86_64=("obscura-${pkgver}-x86_64-linux.tar.gz::${url}/releases/download/v${pkgver}/obscura-x86_64-linux.tar.gz")
source_aarch64=("obscura-${pkgver}-aarch64-linux.tar.gz::${url}/releases/download/v${pkgver}/obscura-aarch64-linux.tar.gz")
sha256sums=('50e6751797c50dedd75ef1b8a0d9e42f5f8472e9fbce91f34718e9f97b0c780a')
sha256sums_x86_64=('b87036c2a162b927eb0d22ca7671f9c53c5bbde257ddc47e3a728140a777286e')
sha256sums_aarch64=('43a5a53aed3e6c1019a711015790206721b619752ba45f4929e7d6d6985a3fbd')

package() {
  install -Dm755 obscura "${pkgdir}/usr/lib/obscura/obscura"
  install -Dm755 obscura-worker "${pkgdir}/usr/lib/obscura/obscura-worker"
  install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  install -d "${pkgdir}/usr/bin"
  ln -s /usr/lib/obscura/obscura "${pkgdir}/usr/bin/obscura"
}
