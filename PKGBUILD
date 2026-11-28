# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=slater-bin
pkgver=0.26.0
pkgrel=1
pkgdesc="Low-memory graph database with Bolt, encryption and vectors"
arch=('x86_64')
url="https://github.com/Hikari-Systems/slater"
license=('Apache-2.0')
depends=('glibc' 'libgcc')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/Hikari-Systems/slater/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/slater-v${pkgver}-x86_64-unknown-linux-gnu.tar.gz")
sha256sums=('a4bfa88db8a3d1371ed0964ca11f0fe41edbfad0418e80dad3556864945c1eab')
sha256sums_x86_64=('5b1e59aedb803f68fff0143fad7584a3588e722b194dce09a7783e2c76b0ddf5')

package() {
  install -Dm755 "slater" "${pkgdir}/usr/bin/slater"
  install -Dm755 "slater-build" "${pkgdir}/usr/bin/slater-build"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
