# Maintainer: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=esteem-bin
pkgver=2.2.7
pkgrel=1
pkgdesc='Alternative mobile & desktop Steem Blockchain client'
arch=('x86_64')
url="https://esteem.app"
license=('MIT')
provides=('esteem')
depends=('gtk3'
         'libxss'
         'gconf'
         'nss')
makedepends=('tar')
source=("${pkgname%-bin}-${pkgver}.deb::https://github.com/ecency/esteem-surfer/releases/download/${pkgver}/esteem-surfer_${pkgver}_amd64.deb"
        'LICENSE::https://github.com/ecency/esteem-surfer/raw/master/LICENSE')
sha256sums=('6df953b1f2eff906daf914cd3a6839c7df5ca50185724ca6326ebaee939e2cfd'
            'e15ab9cfb465d6bb5613a69fca9565e247d9e511b25ee2d8d3d7e80586b10cdc')

package() {
  tar xvf data.tar.xz -C "${pkgdir}/"
  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
# vim:set ts=2 sw=2 et: