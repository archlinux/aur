# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=murr-bin
pkgver=0.3.1
pkgrel=1
pkgdesc="Sub-millisecond cache for ML and AI workloads"
arch=('x86_64' 'aarch64')
url="https://github.com/murrdb/murr"
license=('Apache-2.0')
depends=('glibc' 'libgcc' 'libstdc++')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/murrdb/murr/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64::${_dl}/murr-linux-x64")
source_aarch64=("${pkgname}-${pkgver}-aarch64::${_dl}/murr-linux-arm64")
sha256sums=('c71d239df91726fc519c6eb72d318ec65820627232b2f796219e87dcf35d0ab4')
sha256sums_x86_64=('e05eba20dc9cd80f6a787da289c699d89e908eff251e0059bd2425095079e83e')
sha256sums_aarch64=('d7d0bf3a7bdbbb058bb2a945500067a639f7d9ce3db088ffa43a2eaa39c4ab30')

package() {
  install -Dm755 "${pkgname}-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/murr"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
