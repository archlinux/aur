# Maintainer:  Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=betblocker
pkgver=2.1.2
pkgrel=1
pkgdesc="A free tool to help you control your gambling"
arch=('x86_64')
url="https://betblocker.org"
license=("custom:${pkgname}")
depends=('nodejs-js-yaml'
         'libnotify'
         'nss'
         'libxss'
         'xdg-utils'
         'uuid'
         'libappindicator-gtk3'
         'libsecret')
makedepends=('tar')
options=('!strip')
source=("${pkgname}-${pkgver}.deb::https://betblocker.org/front/download/2"
        'LICENSE')
sha256sums=('b4aa86e0d8cf8f96fc47adbf925fd90bd98368fcc06f0ec1062548346b6619c6'
            'c1a90c883551985f77391e693c6615e5b0e4e408d21bbfb9f90d4f03f0654c73')

package() {
  tar xvf "${srcdir}/data.tar.xz" -C "${pkgdir}/"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -d "${pkgdir}/usr/bin"
  ln -sf '/opt/BetBlocker/BetBlocker' "${pkgdir}/usr/bin/betblocker"
  cd "${pkgdir}/usr/share/doc"
  mv bet-blocker betblocker
}
