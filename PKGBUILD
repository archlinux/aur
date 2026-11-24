# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=hnjobs-bin
pkgver=0.3.2
pkgrel=1
pkgdesc="Find matching jobs in Hacker News Who's Hiring threads"
arch=('x86_64' 'aarch64')
url="https://github.com/mwinters0/hnjobs"
license=('MIT')
depends=('glibc')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/mwinters0/hnjobs/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64::${_dl}/hnjobs-v${pkgver}-linux-amd64")
source_aarch64=("${pkgname}-${pkgver}-aarch64::${_dl}/hnjobs-v${pkgver}-linux-arm64")
sha256sums=('d8cd45d563b95926d1c4ba0be092e4f189d52ed69ebd6a9d0334421652ac1a5d')
sha256sums_x86_64=('cea510e7430899df564925cce4d682c1dba22567979db3c963e2d288ef7a56c9')
sha256sums_aarch64=('780dedb58f0a3c859cf6821df2afacda9ba28dd28aaa1d3b9966f7183eaee68f')

package() {
  install -Dm755 "${pkgname}-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/hnjobs"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
