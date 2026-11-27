# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=lexe-bin
pkgver=0.1.10
pkgrel=1
pkgdesc="Node.js-compatible runtime built on QuickJS"
arch=('x86_64' 'aarch64')
url="https://github.com/Ray-D-Song/lexe"
license=('Apache-2.0')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/Ray-D-Song/lexe/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64::${_dl}/lexe-linux-x64-musl")
source_aarch64=("${pkgname}-${pkgver}-aarch64::${_dl}/lexe-linux-arm64-musl")
sha256sums=('58d1e17ffe5109a7ae296caafcadfdbe6a7d176f0bc4ab01e12a689b0499d8bd')
sha256sums_x86_64=('e5e06b2b63b836f1c1f371720e30ae9431cf2a65b70e0bf7b08b3f3324a104bb')
sha256sums_aarch64=('96ebda1347a681c3f7fa62359d1fd0c5117df33513a620959fbffa12a155c35f')

package() {
  install -Dm755 "${pkgname}-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/lexe"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
