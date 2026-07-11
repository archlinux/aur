# Maintainer: LightJunction <LIghtJUNction.me@gmail.com>

pkgname=obscura-browser-bin
pkgver=0.1.10
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
sha256sums_x86_64=('7efd9d53546b69ed6cc84a47d5c08ee7a7041ee87ab95e7310fda708608a5093')
sha256sums_aarch64=('a50c154970934af3cf9fd2bec6c8a53ff76f25b0c4d9e78c286ce4bc3bca0adf')

package() {
  install -Dm755 obscura "${pkgdir}/usr/lib/obscura/obscura"
  install -Dm755 obscura-worker "${pkgdir}/usr/lib/obscura/obscura-worker"
  install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  install -d "${pkgdir}/usr/bin"
  ln -s /usr/lib/obscura/obscura "${pkgdir}/usr/bin/obscura"
}
