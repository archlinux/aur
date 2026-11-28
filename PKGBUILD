# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=bulloak-bin
pkgver=0.8.1
pkgrel=1
pkgdesc="Generate tests based on the Branching Tree Technique"
arch=('x86_64' 'aarch64')
url="https://github.com/alexfertel/bulloak"
license=('Apache-2.0')
depends=('glibc' 'libgcc')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/alexfertel/bulloak/v${pkgver}/LICENSE-APACHE")
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/bulloak-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/bulloak-aarch64-unknown-linux-gnu.tar.gz")
sha256sums=('a60eea817514531668d7e00765731449fe14d059d3249e0bc93b36de45f759f2')
sha256sums_x86_64=('1db5c21847d22c243956de05069951a53de2561861f950b65f3be20617dd6c74')
sha256sums_aarch64=('feed14fc87d7fa12863ef768379d7c1c854836ee1363d53ea5f7c934e4132bba')

package() {
  install -Dm755 "bulloak" "${pkgdir}/usr/bin/bulloak"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
