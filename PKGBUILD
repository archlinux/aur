# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=bild-bin
pkgver=0.17.1
pkgrel=1
pkgdesc="Image processing algorithms in pure Go"
arch=('x86_64' 'aarch64')
url="https://github.com/anthonynsimon/bild"
license=('MIT')
depends=('glibc')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/anthonynsimon/bild/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/bild_linux_amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/bild_linux_arm64.tar.gz")
sha256sums=('0c5184b0a2ce22abc964669a76795398a9f34f234a09975621113f5fc9db05a5')
sha256sums_x86_64=('f9dc84535b11a7ddc1fdd0b6f585c865de04d6b813149c8e3b2cfbfeda4fe331')
sha256sums_aarch64=('c57ed643e10bf418022715f0dd89e508aa911c5ea99c800f8d41564fca8e19f7')

package() {
  install -Dm755 "bild" "${pkgdir}/usr/bin/bild"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
