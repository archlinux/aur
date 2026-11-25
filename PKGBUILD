# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=kusion-bin
pkgver=0.15.0
pkgrel=1
pkgdesc="Intent-driven platform orchestrator for internal developer platforms"
arch=('x86_64')
url="https://github.com/KusionStack/kusion"
license=('Apache-2.0')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/kusion_${pkgver}_linux_amd64.tar.gz")
sha256sums_x86_64=('459379066fd1c44829437694a519919728aefb98979ad74641184546c925185b')

package() {
  install -Dm755 "kusion" "${pkgdir}/usr/bin/kusion"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
