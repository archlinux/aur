# Maintainer: pandada8 <pandada8@gmail.com>
# Maintainer: istimaldar_sntlk <istimaldar@gmail.com>
pkgname=earthly-bin
pkgver=0.7.15
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
sha512sums=('aa3faab9b9701250ca7a9c33127b752e82b2dd2e038fb8d17dcb10e513b25973181c0691e490a63a6d1557a4a29303698bc4e37078bab26551fbcd3f76e58ee6')

package() {
  install -D "${srcdir}/${pkgname}-${pkgver}" "${pkgdir}/usr/bin/earthly"
  ln -s /usr/bin/earthly "${pkgdir}/usr/bin/earth"
}
