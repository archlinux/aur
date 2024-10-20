# Maintainer: David Cooper <david@dtcooper.com>

pkgname=fakehostname
pkgver=0.3.1
pkgrel=1
pkgdesc="Run a command and fake your hostname."
arch=('i686' 'x86_64' 'aarch64' 'armv7h')
license=('MIT')
url="https://github.com/dtcooper/fakehostname"
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/dtcooper/${pkgname}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('5422942cf75e9a96a252ed63aa95ecbfc8ba9ec292115b76f929d22a17a5e557')

package() {
  cd "${pkgname}-${pkgver}"
  make FAKE_HOSTNAME_VERSION="${pkgver}" LIB_LOCATIONS='/usr/lib:.'
  # mkdir -p "${pkgdir}/usr/lib" "${pkgdir}/usr/lib"
  install -Dm755 fakehostname "${pkgdir}/usr/bin/fakehostname"
  install -Dm755 libfakehostname.so "${pkgdir}/usr/lib/libfakehostname.so"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
