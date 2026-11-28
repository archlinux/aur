# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=talos-backup-bin
pkgver=0.1.0
pkgrel=1
pkgdesc="Talos Linux aware etcd snapshotter"
arch=('x86_64' 'aarch64')
url="https://github.com/siderolabs/talos-backup"
license=('MPL-2.0')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/siderolabs/talos-backup/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64::${_dl}/talos-backup-linux-amd64")
source_aarch64=("${pkgname}-${pkgver}-aarch64::${_dl}/talos-backup-linux-arm64")
sha256sums=('1f256ecad192880510e84ad60474eab7589218784b9a50bc7ceee34c2b91f1d5')
sha256sums_x86_64=('c96eb8c7c694c922f79fa230a4f3fb7bf05252a9675d86601bb8cb39575e03fd')
sha256sums_aarch64=('c916c0992a2576939b74f7112ac25d4a8d6bb3df37596cda2e8ce52e9fb3d04e')

package() {
  install -Dm755 "${pkgname}-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/talos-backup"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
