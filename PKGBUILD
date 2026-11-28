# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=lexe-bin
pkgver=0.1.11
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
sha256sums_x86_64=('fd9f01debe909a56970346f244b5b4c65d5095ec073f75a8ce48409c6df781c1')
sha256sums_aarch64=('923de299592c7ccc91143ff8ef20315c80f00ba2226877affe7f828faa2a45fc')

package() {
  install -Dm755 "${pkgname}-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/lexe"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
