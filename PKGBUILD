# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=satnogs-monitor-bin
pkgver=0.4.3
pkgrel=1
pkgdesc="Terminal UI monitor for SatNOGS ground stations"
arch=('x86_64' 'aarch64')
url="https://github.com/wose/satnogs-monitor"
license=('GPL-3.0-only')
depends=('glib2' 'glibc' 'libgcc')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.xz::${_dl}/satnogs-monitor-x86_64-unknown-linux-gnu.tar.xz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.xz::${_dl}/satnogs-monitor-aarch64-unknown-linux-gnu.tar.xz")
sha256sums_x86_64=('2c06829bf76b3712571740c4b41f97844e6a2de365cc3c0079e995633747a27a')
sha256sums_aarch64=('e678424d2c7053a1b77248fca2a580de67bf9a806a00559554acb105fdef99fa')

package() {
  local _dir
  case $CARCH in
    x86_64) _dir="satnogs-monitor-x86_64-unknown-linux-gnu" ;;
    aarch64) _dir="satnogs-monitor-aarch64-unknown-linux-gnu" ;;
  esac
  install -Dm755 "${_dir}/satnogs-monitor" "${pkgdir}/usr/bin/satnogs-monitor"
  install -Dm644 "${_dir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
