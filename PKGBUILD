# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=kern-bin
pkgver=0.56.0
pkgrel=1
pkgdesc="Fast, rootless, daemonless container runtime and sandbox"
arch=('x86_64' 'aarch64')
url="https://github.com/getkern/kern"
license=('Apache-2.0')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/getkern/kern/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/kern-x86_64-unknown-linux-musl.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/kern-aarch64-unknown-linux-musl.tar.gz")
sha256sums=('cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30')
sha256sums_x86_64=('917db0542ad96019abea51646dfed67d714d6744c7bcd2db8ce78ef31ed8e6ed')
sha256sums_aarch64=('26f5925aca9b16a22afd765f8529ea46f5e08964fb39d10b3e21f6a2767b57e4')

package() {
  install -Dm755 "kern" "${pkgdir}/usr/bin/kern"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
