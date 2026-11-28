# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=nfsdiag-bin
pkgver=0.22.0
pkgrel=1
pkgdesc="NFS diagnostic tool"
arch=('x86_64' 'aarch64')
url="https://github.com/lsferreira42/nfsdiag"
license=('MIT')
depends=('glibc' 'libtirpc')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/lsferreira42/nfsdiag/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64::${_dl}/nfsdiag-linux-amd64")
source_aarch64=("${pkgname}-${pkgver}-aarch64::${_dl}/nfsdiag-linux-arm64")
sha256sums=('a30b9f4ee21ef3285e865e7810442ceb11a4d547c93a0120b4b832ee2a2dcb20')
sha256sums_x86_64=('08bc89383571ee8e10710b90207975098e01bb1c33a9765e3d40270d0b9226c2')
sha256sums_aarch64=('dc9e7285ce60d920ec126ca80db1392462dba7d62daec7e07acc5d926dcef52e')

package() {
  install -Dm755 "${pkgname}-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/nfsdiag"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
