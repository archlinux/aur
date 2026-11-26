# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=sshocker-bin
pkgver=0.3.11
pkgrel=1
pkgdesc="SSH with reverse sshfs and port forwarding in a Docker-like CLI"
arch=('x86_64' 'aarch64')
url="https://github.com/lima-vm/sshocker"
license=('Apache-2.0')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/lima-vm/sshocker/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64::${_dl}/sshocker-Linux-x86_64")
source_aarch64=("${pkgname}-${pkgver}-aarch64::${_dl}/sshocker-Linux-aarch64")
sha256sums=('cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30')
sha256sums_x86_64=('9e2a8437640abad8533e6246bd042670f8f927e3a883b85a1392129bfef6e843')
sha256sums_aarch64=('7f35ca1cbf13483cad882ea85d29c8e84f2530e4a0ad62c1bd31a90a53ead49f')

package() {
  install -Dm755 "${pkgname}-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/sshocker"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
