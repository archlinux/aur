# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=egres-bin
pkgver=0.2610.0
pkgrel=1
pkgdesc="Postgres-compatible database for heavy multi-tenant workloads"
arch=('x86_64')
url="https://github.com/manishrjain/egres"
license=('Apache-2.0')
depends=('glibc')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/egres-v${pkgver}-linux-x86_64.tar.gz")
sha256sums_x86_64=('252d5deb1d07bd3bf1842785881ff297e248115aa54e950774866646cd1c05fa')

package() {
  install -Dm755 "egres" "${pkgdir}/usr/bin/egres"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
