# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=sympozium-bin
pkgver=0.13.0
pkgrel=1
pkgdesc="Coordination layer for multi-agent AI"
arch=('x86_64' 'aarch64')
url="https://github.com/sympozium-ai/sympozium"
license=('MIT')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/sympozium-ai/sympozium/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/sympozium-linux-amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/sympozium-linux-arm64.tar.gz")
sha256sums=('b52696dc0457bf58616f5017e5146b2932611b9357bb9824c7c91183fc36471f')
sha256sums_x86_64=('84eb839a0eba247f496e25deaadbd290155759597607ad883f3b84663da4b72e')
sha256sums_aarch64=('68312e25c00d71e9b9b71d9769ee17e71c6b1feaf7afa9e0b50d9edd65c8e42e')

package() {
  install -Dm755 "sympozium" "${pkgdir}/usr/bin/sympozium"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
