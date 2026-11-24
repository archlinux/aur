# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=g-systemctl-bin
pkgver=2.6.0
pkgrel=1
pkgdesc="Terminal UI to manage systemd services and Docker containers"
arch=('x86_64' 'aarch64')
url="https://github.com/shakg/g-systemctl"
license=('MIT')
depends=('glibc')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/shakg/g-systemctl/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/g-systemctl-linux-x86_64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/g-systemctl-linux-aarch64.tar.gz")
sha256sums=('61244454d99d69f3e09a94b6d5fcbd6bd1eee9b3dfa39c5f191439679ceba5d5')
sha256sums_x86_64=('35d5e4a1a95946e323f5f343c1434b05a373cc45d81077d78a180c954995bd80')
sha256sums_aarch64=('bc7b24c6363c646815135d48d04d85a0573a3e34d4d389fa3a9357c3f0cbd84c')

package() {
  install -Dm755 "g-systemctl-${pkgver}/g-systemctl" "${pkgdir}/usr/bin/g-systemctl"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
