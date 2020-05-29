# Maintainer:  Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=betblocker
pkgver=1.9.0
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
sha256sums=('c49663e089d13159304052140c10db7fd16ebf292bd8428658b2664d87528a4e'
            'SKIP')

package() {
  tar xvf "${srcdir}/data.tar.xz" -C "${pkgdir}/"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -d "${pkgdir}/usr/bin"
  ln -sf '/opt/BetBlocker/BetBlocker' "${pkgdir}/usr/bin/betblocker"
  cd "${pkgdir}/usr/share/doc"
  mv bet-blocker betblocker
}