# Maintainer: LaT-SKY <miprota@163.com>
pkgname=mircode-bin
pkgver=1.0.1
pkgrel=1
pkgdesc="Companion daemon & TUI config manager for MirCode mobile Git code review workspace"
arch=('x86_64')
url="https://github.com/LaT-SKY/MirCode"
license=('MIT')
depends=('git')
provides=('mircode')
conflicts=('mircode')
source_x86_64=(
  "${pkgname}-${pkgver}.tar.gz::https://github.com/LaT-SKY/MirCode/releases/download/v${pkgver}/mircode-v${pkgver}-linux-amd64.tar.gz"
  "mircode.service"
  "LICENSE"
)
sha256sums_x86_64=(
  '9ad88a3dc7919fbc69eb3ecdd92041e0a7ab00331e67900cdee822dee525b14d'
  'f5ec80794e4f2501cef74e7ffaf46fd62299d2946e0bc03d9e6c574571b7b2c2'
  '9350ee61b37b3179ea7ef5db602dc0f9edfa4d29b3ad802187daec1892a85104'
)

package() {
  if [ -f "${srcdir}/mircode-linux-amd64" ]; then
    install -Dm755 "${srcdir}/mircode-linux-amd64" "${pkgdir}/usr/bin/mircode"
  else
    install -Dm755 "${srcdir}/mircode" "${pkgdir}/usr/bin/mircode"
  fi
  install -Dm644 "${srcdir}/mircode.service" "${pkgdir}/usr/lib/systemd/user/mircode.service"
  install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
