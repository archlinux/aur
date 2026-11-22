# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=inertia-bin
pkgver=0.1.0
pkgrel=1
pkgdesc="A 3D physics simulator in your terminal"
arch=('x86_64')
url="https://github.com/aclfe/inertia"
license=('MIT OR Apache-2.0')
depends=('glibc' 'libgcc')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/aclfe/inertia/v${pkgver}/LICENSE-MIT")
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/inertia-x86_64-unknown-linux-gnu.tar.gz")
sha256sums=('fbf9337dd2ab3c5c79e5947380110debcf490afd523b60e95b926b120d084877')
sha256sums_x86_64=('863827f90df8f63053bef81598335d61f8246e23e2e5034fc3d7e179ea08dce2')

package() {
  install -Dm755 "inertia" "${pkgdir}/usr/bin/inertia"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
