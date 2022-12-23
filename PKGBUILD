# Maintainer: pandada8 <pandada8@gmail.com>
# Maintainer: istimaldar_sntlk <istimaldar@gmail.com>
pkgname=earthly-bin
pkgver=0.6.30
pkgrel=1
pkgdesc='Build automation for the container era'
arch=('x86_64')
url='https://earthly.dev'
license=('custom:BSL', 'MPL-2.0')
install=${pkgname}.install
depends=(
  'docker'
  'git'
)
provides=('earthly')
conflicts=('earthly')

source=(
  "${pkgname}-${pkgver}::https://github.com/earthly/earthly/releases/download/v${pkgver}/earthly-linux-amd64"
)
sha512sums=('5263b6a73700710e4c53b908f6c66fad9258d167a94110667e7cf4e036decb1b26c89743b0424a3028abcf1b1a52e05b1489ace48a9c6415a062651e3473c424')

package() {
  install -D "${srcdir}/${pkgname}-${pkgver}" "${pkgdir}/usr/bin/earthly"
  ln -s /usr/bin/earthly "${pkgdir}/usr/bin/earth"
}
