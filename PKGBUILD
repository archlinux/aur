# Maintainer: Ryan Wilson <ryan@ryanwilson.io>
pkgname=fafind-bin
pkgver=2.0.0
pkgrel=1
pkgdesc="Fast parallel filesystem search by filename (faf / fafind)"
arch=('x86_64' 'aarch64')
url="https://github.com/rywils/fafind"
license=('MIT')
provides=('fafind' 'faf')
conflicts=('fafind')
options=('!debug' 'strip')
_url="https://github.com/rywils/fafind/releases/download/v${pkgver}"
source=(
  "LICENSE::https://raw.githubusercontent.com/rywils/fafind/v${pkgver}/LICENSE"
)
source_x86_64=(
  "fafind-x86_64-${pkgver}.tar.gz::${_url}/fafind-linux-x86_64-v${pkgver}.tar.gz"
)
source_aarch64=(
  "fafind-arm64-${pkgver}.tar.gz::${_url}/fafind-linux-arm64-v${pkgver}.tar.gz"
)
sha256sums=('2b886bfac9bf7b24d5eaca6437abccfd1d31068ed6d1c06abda74ebf1e55d51a')
sha256sums_x86_64=('d89f7118fdac02f6e8dac2ac13d7767dc0b0d133a568606498637251a2a349c8')
sha256sums_aarch64=('cfcbc456e0a3785103034801b013260164849b4765d39e0988b2c1dcee29d600')

package() {
  install -Dm755 fafind "${pkgdir}/usr/bin/fafind"
  ln -s fafind "${pkgdir}/usr/bin/faf"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
