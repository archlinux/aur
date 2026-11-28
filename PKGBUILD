# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=grate-bin
pkgver=2.3.0
pkgrel=1
pkgdesc="SQL script migration runner"
arch=('x86_64' 'aarch64')
url="https://github.com/grate-devs/grate"
license=('MIT')
depends=('glibc' 'libgcc' 'libstdc++')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/grate-devs/grate/${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64.zip::${_dl}/grate-linux-x64-self-contained-${pkgver}.zip")
source_aarch64=("${pkgname}-${pkgver}-aarch64.zip::${_dl}/grate-linux-arm64-self-contained-${pkgver}.zip")
sha256sums=('8e39e87db4d52cc59406e7da7be49f7f88161144d5d85966d2754fdd938349fd')
sha256sums_x86_64=('b0fe4cfd5fac4721d8284a56f668c6df6bd2aef1f3b68d9f65c0274db8bd8c8b')
sha256sums_aarch64=('f2a02b2e4475c22966ea5d70881bba988677111d7d7b0f2f589c784421b3d9c7')

package() {
  install -Dm755 "grate" "${pkgdir}/usr/bin/grate"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
