# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=shoelaces-bin
pkgver=1.4.0
pkgrel=1
pkgdesc="Painless server bootstrapping over iPXE"
arch=('x86_64' 'aarch64')
url="https://github.com/thousandeyes/shoelaces"
license=('Apache-2.0')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/thousandeyes/shoelaces/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64::${_dl}/shoelaces-linux-amd64")
source_aarch64=("${pkgname}-${pkgver}-aarch64::${_dl}/shoelaces-linux-arm64")
sha256sums=('c71d239df91726fc519c6eb72d318ec65820627232b2f796219e87dcf35d0ab4')
sha256sums_x86_64=('7f55569722baed4fed21420d477be2a29fcd9fa91b3b26d820e316b7bb608036')
sha256sums_aarch64=('2d1089c1b3f42407e0e34e59e5c14e1deb8fc310d1bb71bb40ebdf948a861ced')

package() {
  install -Dm755 "${pkgname}-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/shoelaces"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
