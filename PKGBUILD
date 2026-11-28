# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=crproxy-bin
pkgver=0.12.6
pkgrel=1
pkgdesc="Generic container registry proxy"
arch=('x86_64' 'aarch64')
url="https://github.com/DaoCloud/crproxy"
license=('MIT')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/DaoCloud/crproxy/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64::${_dl}/crproxy_linux_amd64")
source_aarch64=("${pkgname}-${pkgver}-aarch64::${_dl}/crproxy_linux_arm64")
sha256sums=('a9aa16248ab452deff543ae82005a871ce93fcd4129f516915c7bbc7ddc78ec6')
sha256sums_x86_64=('51c52e5d531d8e28fb2899c32e29ff8db0459eb154fd034c74e55711417b7829')
sha256sums_aarch64=('3fc4cba73ec3a6a087107b7d6648eec7dfc1b58596eff437781d7a07431b0c7f')

package() {
  install -Dm755 "${pkgname}-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/crproxy"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
