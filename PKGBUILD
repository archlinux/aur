# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=nginx-build-bin
pkgver=0.16.34
pkgrel=1
pkgdesc="Seamless nginx builder"
arch=('x86_64' 'aarch64')
url="https://github.com/cubicdaiya/nginx-build"
license=('MIT')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/nginx-build-linux-amd64-${pkgver}.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/nginx-build-linux-arm64-${pkgver}.tar.gz")
sha256sums_x86_64=('bfd7f3aa477886f26b27a68d9243d436ce6d1552dfa797ccb17c2da0a188234a')
sha256sums_aarch64=('2397a20f5192a74ea1d4e6c9f039310283972e5bf384e30347d747225e7443a1')

package() {
  install -Dm755 "nginx-build" "${pkgdir}/usr/bin/nginx-build"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
