# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=perses-bin
pkgver=0.55.1
pkgrel=1
pkgdesc="The CNCF sandbox for observability visualisation"
arch=('x86_64' 'aarch64')
url="https://github.com/perses/perses"
license=('Apache-2.0')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/perses_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/perses_${pkgver}_linux_arm64.tar.gz")
sha256sums_x86_64=('7c38ace5ce665e22d7d4f823b8bc0c8e91f9bcef381f218d8c564e0fe62ba750')
sha256sums_aarch64=('bd777b183622e2eaeda6645748be47d65afb67eb91aa8d8d726a7c10efd8a1c5')

package() {
  install -Dm755 "percli" "${pkgdir}/usr/bin/percli"
  install -Dm755 "perses" "${pkgdir}/usr/bin/perses"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
