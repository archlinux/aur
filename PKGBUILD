# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=docker-gen-bin
pkgver=0.18.0
pkgrel=1
pkgdesc="Generate files from docker container meta-data"
arch=('x86_64' 'aarch64')
url="https://github.com/nginx-proxy/docker-gen"
license=('MIT')
depends=('glibc')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/nginx-proxy/docker-gen/${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/docker-gen-linux-amd64-${pkgver}.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/docker-gen-linux-arm64-${pkgver}.tar.gz")
sha256sums=('cb50f4c87f6871ae53442a66a47ab5d8914c5b53a7f83738839b53fa55c6c66b')
sha256sums_x86_64=('c0be2054e9ef5ace02b7bcac524d64aa9a7148f50203ef6ec765497422324abf')
sha256sums_aarch64=('af6fa03388c50c2424feb35389d900a3d81186c1ef4d0227bf645cb64cbbf0fc')

package() {
  install -Dm755 "docker-gen" "${pkgdir}/usr/bin/docker-gen"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
