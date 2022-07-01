# Maintainer: pandada8 <pandada8@gmail.com>
# Maintainer: istimaldar_sntlk <istimaldar@gmail.com>
pkgname=earthly-bin
pkgver=0.6.19
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
sha512sums=('cb0800fe5ceab12532858d8bf0eccb0328f811e975893bd703a163017c8069728ff5fb6984337309e94846fa3cea349db51615e5c2be0ce562a70ae558a2d5cf')

package() {
  install -D "${srcdir}/${pkgname}-${pkgver}" "${pkgdir}/usr/bin/earthly"
  ln -s /usr/bin/earthly "${pkgdir}/usr/bin/earth"
}
