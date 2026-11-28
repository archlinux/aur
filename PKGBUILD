# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=manyacg-bin
pkgver=1.21.2
pkgrel=1
pkgdesc="Collect, organize and share anime artworks"
arch=('x86_64' 'aarch64')
url="https://github.com/krau/ManyACG"
license=('AGPL-3.0-only')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/krau/ManyACG/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/manyacg-v${pkgver}-linux-amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/manyacg-v${pkgver}-linux-arm64.tar.gz")
sha256sums=('8486a10c4393cee1c25392769ddd3b2d6c242d6ec7928e1414efff7dfb2f07ef')
sha256sums_x86_64=('f28ac35c98d423dde3b30d6ee8e95dab0613c7f235d41eff75fc4f0953b70c44')
sha256sums_aarch64=('c61fe1aeaf0f0fa5188646e58c2f6a2643737a943deb33e8df1217b91404737b')

package() {
  install -Dm755 "manyacg" "${pkgdir}/usr/bin/manyacg"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
