# Maintainer: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=emage-bin
pkgver=1.1.0
pkgrel=1
pkgdesc="A cross-platform tool for lossless image compression"
url='https://emage.js.org'
arch=('x86_64')
provides=("${pkgname%-bin}")
license=('MIT')
depends=('gconf'
         'libxss'
         'libjpeg-turbo'
         'nss'
         'gtk3'
         'nodejs')
makedepends=('tar')
source=("${pkgname%-bin}-${pkgver}.deb::https://github.com/douglasjunior/emage/releases/download/${pkgver}/emage_${pkgver}_amd64.deb"
        'LICENSE::https://github.com/douglasjunior/emage/raw/master/LICENSE')
sha256sums=('f3402a19abd69fb51a1fdce832db9ab0bcc37e3922a9f815eebb71da9a65a0b1'
            '7e307ff9c6e8e44664468763e32b9260e743c74ee2cd9b141e6f38f548c3fc26')

package() {
  tar xvf data.tar.xz -C "${pkgdir}/"
  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}