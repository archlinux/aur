# Maintainer: LightJunction <LIghtJUNction.me@gmail.com>

pkgname=obscura-browser-bin
pkgver=0.1.8
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
sha256sums_x86_64=('e54d07054047d4180247f03bea08d1bd724ef1859829331a433da972f973988b')
sha256sums_aarch64=('58602b8293a93caa6fdac98a2868292c9a91ecab86d835f9bd20361ac7e48ea0')

package() {
  install -Dm755 obscura "${pkgdir}/usr/lib/obscura/obscura"
  install -Dm755 obscura-worker "${pkgdir}/usr/lib/obscura/obscura-worker"
  install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  install -d "${pkgdir}/usr/bin"
  ln -s /usr/lib/obscura/obscura "${pkgdir}/usr/bin/obscura"
}
