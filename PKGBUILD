# Maintainer: Philipp Claßen <philipp.classen@posteo.de>
pkgname=buckaroo
pkgver=2.2.0
pkgrel=1
pkgdesc="A C++ package manager"
arch=('x86_64')
url="https://github.com/LoopPerfect/buckaroo"
license=('MIT')
depends=('buck')
options=(!strip)

source=("https://github.com/LoopPerfect/buckaroo/releases/download/v${pkgver}/buckaroo-linux")
sha256sums=('23f9a4145a3e51f1205a4b265374c548fc4a4e9156e5121285f5c5bdb4d3228c')

package() {
  # Make telemetry an opt-in feature
  mkdir -p "${pkgdir}/etc/profile.d"
  echo "export BUCKAROO_TELEMETRY_OPT_OUT=1" > "${pkgdir}/etc/profile.d/buckaroo-telemetry-opt-out.sh"

  # Install the binary
  install -Dm755 buckaroo-linux "${pkgdir}/usr/bin/buckaroo"
}