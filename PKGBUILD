# Maintainer: Philipp Claßen <philipp.classen@posteo.de>
pkgname=buckaroo
pkgver=3.0.2
pkgrel=1
pkgdesc="A C++ package manager"
arch=('x86_64')
url="https://github.com/LoopPerfect/buckaroo"
license=('MIT')
options=(!strip)

source=("https://github.com/LoopPerfect/buckaroo/releases/download/v${pkgver}/buckaroo-linux")
sha256sums=('bcdb6e07bc3d9e2f84f1eb100c7bc9fa630f770eb230aa4f4b772c1b1492dcde')

package() {
  # Make telemetry an opt-in feature
  mkdir -p "${pkgdir}/etc/profile.d"
  echo "export BUCKAROO_TELEMETRY_OPT_OUT=1" > "${pkgdir}/etc/profile.d/buckaroo-telemetry-opt-out.sh"

  # Install the binary
  install -Dm755 buckaroo-linux "${pkgdir}/usr/bin/buckaroo"
}
