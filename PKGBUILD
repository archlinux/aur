# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=jbundle-bin
pkgver=0.2.0
pkgrel=1
pkgdesc="Package JVM applications into self-contained binaries"
arch=('x86_64' 'aarch64')
url="https://github.com/avelino/jbundle"
license=('MIT')
depends=('glibc' 'libgcc')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/avelino/jbundle/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/jbundle-linux-x86_64-v${pkgver}.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/jbundle-linux-aarch64-v${pkgver}.tar.gz")
sha256sums=('da9ad3d79150d7b5392fd79d9185014d8250020a00e9ebb913ae380bbdfa1457')
sha256sums_x86_64=('83a51b8e7ca6b3c9e68f994f0b6087e4213b2d2b1f32aa3f174f2ed41f40afdf')
sha256sums_aarch64=('8bc89ad75e4c7517561369b1e8c7279ef14c02fb1c475d5d18b40c80ffa168fd')

package() {
  install -Dm755 "jbundle" "${pkgdir}/usr/bin/jbundle"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
