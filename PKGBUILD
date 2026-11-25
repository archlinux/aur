# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=double-entry-generator-bin
pkgver=2.16.0
pkgrel=1
pkgdesc="Rule-based double-entry bookkeeping importer for Alipay, WeChat and other sources"
arch=('x86_64' 'aarch64')
url="https://github.com/deb-sig/double-entry-generator"
license=('Apache-2.0')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/double-entry-generator_Linux_x86_64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/double-entry-generator_Linux_arm64.tar.gz")
sha256sums_x86_64=('dc299f76c3e2683d50f3912c047af74e3203feef1726a5593f95757fdc37d033')
sha256sums_aarch64=('e41068de9169aa6a7c1fa291da98f13ae77b4bb0a2f61b5c5a358afd0e68ad94')

package() {
  install -Dm755 "double-entry-generator" "${pkgdir}/usr/bin/double-entry-generator"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
