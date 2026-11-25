# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=clicd-bin
pkgver=1.1.41
pkgrel=1
pkgdesc="CLICD is a lightweight LXC/KVM virtualization management panel featuring a web console, batch operations, image management, NAT networking, IPv6 allocation, WebSSH, VNC, resource and bandwidth controls, security monitoring, and delegated user access"
arch=('x86_64' 'aarch64')
url="https://github.com/MengMengCode/CLICD"
license=('Apache-2.0')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/MengMengCode/CLICD/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/clicd-linux-amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/clicd-linux-arm64.tar.gz")
sha256sums=('c71d239df91726fc519c6eb72d318ec65820627232b2f796219e87dcf35d0ab4')
sha256sums_x86_64=('eb28cd65e19261cb1e3e90dbb8aa1c040106624c02e5fc89330224622f1c3c8b')
sha256sums_aarch64=('1e1dbe3754c8a0d9074465bb711f2cfeb140f4437261e2e69a49b4cda8a8ed73')

package() {
  local _dir
  case $CARCH in
    x86_64) _dir="clicd-linux-amd64" ;;
    aarch64) _dir="clicd-linux-arm64" ;;
  esac
  install -Dm755 "${_dir}/clicd" "${pkgdir}/usr/bin/clicd"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
