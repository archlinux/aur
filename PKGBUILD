# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=gomodjail-bin
pkgver=2.0.1
pkgrel=1
pkgdesc="Experimental jail for Go modules"
arch=('x86_64' 'aarch64')
url="https://github.com/AkihiroSuda/gomodjail"
license=('Apache-2.0')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/AkihiroSuda/gomodjail/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/gomodjail-v${pkgver}.linux-amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/gomodjail-v${pkgver}.linux-arm64.tar.gz")
sha256sums=('cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30')
sha256sums_x86_64=('b46073f6ecde744f3f263d8885385032f8b798aa319dd48b9978f75115e53244')
sha256sums_aarch64=('1da276fd541c08b7a971fe09043c0922fd53f032740755debabf16c136677218')

package() {
  install -Dm755 "./bin/gomodjail" "${pkgdir}/usr/bin/gomodjail"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
