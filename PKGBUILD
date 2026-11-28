# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=magec-bin
pkgver=2.6.0
pkgrel=1
pkgdesc="Multi-agent AI platform with voice and text control"
arch=('x86_64' 'aarch64')
url="https://github.com/achetronic/magec"
license=('Apache-2.0')
depends=('glibc')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/achetronic/magec/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/magec-linux-amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/magec-linux-arm64.tar.gz")
sha256sums=('81857fb8ba669ec3ff4a889c8afd40e213f8464891f6f092918ef3f873297eba')
sha256sums_x86_64=('b672ec6666c04d8ec3f99c1773d045fd64f63ea058b7c84412c6aa8638e977ec')
sha256sums_aarch64=('cd8ca737a48769b5093c2feb3808c040584ffe2f0afc26b47b173f6c4604cad3')

package() {
  install -Dm755 "./magec" "${pkgdir}/usr/bin/magec"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
