# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=soci-snapshotter-bin
pkgver=0.16.1
pkgrel=1
pkgdesc="containerd snapshotter that lazily loads standard OCI images"
arch=('x86_64' 'aarch64')
url="https://github.com/awslabs/soci-snapshotter"
license=('Apache-2.0')
depends=('glibc')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/awslabs/soci-snapshotter/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/soci-snapshotter-${pkgver}-linux-amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/soci-snapshotter-${pkgver}-linux-arm64.tar.gz")
sha256sums=('09e8a9bcec8067104652c168685ab0931e7868f9c8284b66f5ae6edae5f1130b')
sha256sums_x86_64=('2be9f26ad853455515da69885f8906e6aecc65684cc302f8689c25cad8417bc8')
sha256sums_aarch64=('ad96f7ff1babfdb089a7cb481b7362aced9caaa73c91604d11b04b1066c47cca')

package() {
  install -Dm755 "soci" "${pkgdir}/usr/bin/soci"
  install -Dm755 "soci-snapshotter-grpc" "${pkgdir}/usr/bin/soci-snapshotter-grpc"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
