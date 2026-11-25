# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=sablier-bin
pkgver=1.21.1
pkgrel=1
pkgdesc="Start your containers on demand, shut them down automatically when there's no activity"
arch=('x86_64' 'aarch64')
url="https://github.com/sablierapp/sablier"
license=('AGPL-3.0-only')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/sablier-${pkgver}-linux-amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/sablier-${pkgver}-linux-arm64.tar.gz")
sha256sums_x86_64=('732ccbf475e149e6c0e116147ea0259a2454e4c066e4f08d90a9fac675075b94')
sha256sums_aarch64=('f4611b153cd7c2dd6aa16065269045ddf35a222542462e11957adfd0feb9cabb')

package() {
  install -Dm755 "sablier" "${pkgdir}/usr/bin/sablier"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
