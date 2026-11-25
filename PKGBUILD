# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=mempalace-bin
pkgver=3.12.0
pkgrel=1
pkgdesc="The best-benchmarked open-source AI memory system"
arch=('x86_64')
url="https://github.com/MemPalace/mempalace"
license=('MIT')
depends=('glibc' 'libgcc')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/MemPalace/mempalace/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64::${_dl}/mempalace-native-linux-amd64")
sha256sums=('81dc6cc278d80f0f1b028ecd86af30d61e441b9ae53d9d9a2ed19389ba657a5d')
sha256sums_x86_64=('fd0f5075ed22f34875cdf0d742af7d0dfd71c1efd052364b35260815b7664434')

package() {
  install -Dm755 "${pkgname}-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/mempalace-native"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
