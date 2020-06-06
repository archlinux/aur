# Maintainer: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=ten-hands-bin
pkgver=2.7.0
pkgrel=1
pkgdesc="Simplest way to organize and run tasks"
arch=('x86_64')
url='https://tenhands.app'
depends=('gtk3'
         'nss'
         'libxss')
license=('MIT')
provides=('ten-hands')
source=("${pkgname}-${pkgver}.deb::https://github.com/saisandeepvaddi/ten-hands/releases/download/v${pkgver}/ten-hands-app_${pkgver}_amd64.deb"
        'LICENSE::https://github.com/saisandeepvaddi/ten-hands/raw/master/LICENSE')
sha256sums=('bf11b78ef01a94fd0a5bc231629d92b2c513d963fd8b0479caa7c18a641c12b4'
            '6b30b7530e47b208e4da08c8813ca52c63aae00d74d0b2036548069f59588d02')

package() {
  tar xvf "${srcdir}/data.tar.xz" -C "${pkgdir}/"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}