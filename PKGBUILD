# Maintainer: David Cooper <david@dtcooper.com>

pkgname=fakehostname
pkgver=0.3.0
pkgrel=1
pkgdesc="Run a command and fake your hostname."
arch=('i686' 'x86_64' 'aarch64' 'armv7h')
license=('MIT')
url="https://github.com/dtcooper/fakehostname"
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/dtcooper/${pkgname}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('f5e1cce5d3091bbbe98b4edb411bdcb3dc9737bf8a78391de831bf7650e59bbe')

package() {
  cd "${pkgname}-${pkgver}"
  make FAKE_HOSTNAME_VERSION="${pkgver}" LIB_LOCATIONS='.:/usr/lib'
  # mkdir -p "${pkgdir}/usr/lib" "${pkgdir}/usr/lib"
  install -Dm755 fakehostname "${pkgdir}/usr/bin/fakehostname"
  install -Dm755 libfakehostname.so "${pkgdir}/usr/lib/libfakehostname.so"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
