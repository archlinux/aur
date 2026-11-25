# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=tengo-bin
pkgver=3.0.0
pkgrel=1
pkgdesc="A fast script language for Go"
arch=('x86_64' 'aarch64')
url="https://github.com/d5/tengo"
license=('MIT')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/d5/tengo/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/tengo_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/tengo_${pkgver}_linux_arm64.tar.gz")
sha256sums=('7150e12a44e955941375688e0abaf7a49dc9f675826ea87c310a16f8ae660516')
sha256sums_x86_64=('00d452ae175d2d0ff1d9bf758697fe8748995c0d0538f657d58d2ee3d80b8e19')
sha256sums_aarch64=('84ffd709153b5814da1f77033462f49eb04d69b39fcf3e8a06d94c0a3a9ecb27')

package() {
  install -Dm755 "tengo" "${pkgdir}/usr/bin/tengo"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
