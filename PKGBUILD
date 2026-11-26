# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=portier-broker-bin
pkgver=0.15.2
pkgrel=1
pkgdesc="Reference implementation of the Portier login broker"
arch=('x86_64' 'aarch64')
url="https://github.com/portier/portier-broker"
license=('Apache-2.0')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tgz::${_dl}/Portier-Broker-v${pkgver}-Linux-x86_64.tgz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tgz::${_dl}/Portier-Broker-v${pkgver}-Linux-aarch64.tgz")
sha256sums_x86_64=('af9cc6bf04431ad79268422b66db3227a55ae3feb3f2a2945039c8e78f1f26c1')
sha256sums_aarch64=('21ddce2b4657c3ec768aa3d5597bc6e4cc3a592bc5817e1ef86c8bf488d17714')

package() {
  local _dir
  case $CARCH in
    x86_64) _dir="Portier-Broker-v${pkgver}-Linux-x86_64" ;;
    aarch64) _dir="Portier-Broker-v${pkgver}-Linux-aarch64" ;;
  esac
  install -Dm755 "${_dir}/portier-broker" "${pkgdir}/usr/bin/portier-broker"
  install -Dm644 "${_dir}/LICENSE-MIT" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "${_dir}/LICENSE-APACHE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
