# Maintainer: David Cooper <david@dtcooper.com>

pkgname=fakehostname
pkgver=0.3.2
pkgrel=2
pkgdesc="Run a command and fake your hostname."
arch=('i686' 'x86_64' 'aarch64' 'armv7h')
license=('MIT')
url="https://github.com/dtcooper/fakehostname"
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/dtcooper/${pkgname}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('b25e04b409d69bd5319ce1ad55888e9ac6ece68a943d62d8209dee26faf072da')

package() {
  cd "${pkgname}-${pkgver}"
  make FAKE_HOSTNAME_VERSION="${pkgver}" LIB_LOCATIONS='/usr/lib:.'
  install -Dm755 fakehostname "${pkgdir}/usr/bin/fakehostname"
  install -Dm755 libfakehostname.so "${pkgdir}/usr/lib/libfakehostname.so"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
