# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=kind2-bin
pkgver=3.0.0
pkgrel=1
pkgdesc="SMT-based model checker for Lustre programs"
arch=('x86_64' 'aarch64')
url="https://github.com/kind2-mc/kind2"
license=('Apache-2.0')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/kind2-mc/kind2/v${pkgver}/LICENSE.rst")
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/kind2-v${pkgver}-linux-x86_64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/kind2-v${pkgver}-linux-arm64.tar.gz")
sha256sums=('e352f632b47ae583ce2a1831b57a069462e4fafba2b2e613e6c7e1ffcfe5541f')
sha256sums_x86_64=('a8d08130a1ae8039ff42474fccee955880491061fc7b97d3954d3e66e6faa19d')
sha256sums_aarch64=('914c912059195059e796f914e881adb283eb640e50222346ff87cb2ba8edda02')

package() {
  install -Dm755 "kind2" "${pkgdir}/usr/bin/kind2"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
