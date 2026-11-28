# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=gsc-tool-bin
pkgver=1.6.2
pkgrel=1
pkgdesc="Compile and decompile IW engine game scripts"
arch=('x86_64' 'aarch64')
url="https://github.com/xensik/gsc-tool"
license=('GPL-3.0-only')
depends=('glibc' 'libgcc' 'libstdc++')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/xensik/gsc-tool/${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/linux-amd64-release.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/linux-arm64-release.tar.gz")
sha256sums=('3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986')
sha256sums_x86_64=('ccd9f5062eccb26fe798f9a4d89bef71c019602aa2b90a4edd67011e2dcaf0b8')
sha256sums_aarch64=('6bcfc06679f635820f9963a36af88ad70600d900a969cb8b79cc6bf19a0db3bb')

package() {
  install -Dm755 "./gsc-tool" "${pkgdir}/usr/bin/gsc-tool"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
