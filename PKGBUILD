# Maintainer: pandada8 <pandada8@gmail.com>
# Maintainer: istimaldar_sntlk <istimaldar@gmail.com>
pkgname=earthly-bin
pkgver=0.6.22
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
sha512sums=('7888e93fc99034e40feb4ebfafabb3b6eddc5dd672b600b771b13e2d542140d19c3e68782eeb9af90ec639e0f55e7f307323ff7cf3006168258e691b04dd8006')

package() {
  install -D "${srcdir}/${pkgname}-${pkgver}" "${pkgdir}/usr/bin/earthly"
  ln -s /usr/bin/earthly "${pkgdir}/usr/bin/earth"
}
