# Maintainer: pandada8 <pandada8@gmail.com>
# Maintainer: istimaldar_sntlk <istimaldar@gmail.com>
pkgname=earthly-bin
pkgver=0.8.11
pkgrel=1
pkgdesc='Build automation for the container era'
arch=('x86_64')
url='https://earthly.dev'
license=('custom:BSL', 'MPL-2.0')
install=${pkgname}.install
depends=(
  'git'
)
optdepends=(
  'docker: Using Docker as runtime'
  'podman: Using podman as runtime'
)
provides=('earthly')
conflicts=('earthly')

source=(
  "${pkgname}-${pkgver}::https://github.com/earthly/earthly/releases/download/v${pkgver}/earthly-linux-amd64"
)
sha512sums=('9d4735ee8f8b35ef5aa3bf664a234e0fe0d7424bf77b971d9efc7aed284d4dfc8ecf2b0847d2fecc93b01a8530571b6b11c8c3d2643656ed0bea795950c32cfe')

package() {
  install -D "${srcdir}/${pkgname}-${pkgver}" "${pkgdir}/usr/bin/earthly"
  ln -s /usr/bin/earthly "${pkgdir}/usr/bin/earth"
}
