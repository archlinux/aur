# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=bruin-bin
pkgver=0.11.836
pkgrel=1
pkgdesc="Build data pipelines with SQL and Python, ingest data from different sources, add quality checks, and build end-to-end flows"
arch=('x86_64' 'aarch64')
url="https://github.com/bruin-data/bruin"
license=('Apache-2.0')
depends=('glibc' 'libgcc' 'libstdc++')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/bruin_Linux_x86_64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/bruin_Linux_arm64.tar.gz")
sha256sums_x86_64=('fc2e0638487dad86eea996b45466ed41d7beb0b873220b088ea4182a89d98c3c')
sha256sums_aarch64=('ab5b2df5bcd312681e0c7db566303013dd82a90d24a0430f69b7a1d20070e126')

package() {
  install -Dm755 "bruin" "${pkgdir}/usr/bin/bruin"
  install -Dm644 "LICENSE.md" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
