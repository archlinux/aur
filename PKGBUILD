# Maintainer: Frederic Bezies <fredbezies at gmail dot com>
# Contributor: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=omniawrite
pkgver=1.3.2
pkgrel=1
pkgdesc="A next-generation cross-platform plain text editor engineered for creative writing"
arch=('x86_64')
url='https://omniawrite.com'
depends=('gtk3'
         'nss')
license=("custom:${pkgname}")
source=("${pkgname}-${pkgver}.rpm::https://external.omniawrite.com/download/rpm"
        'LICENSE')
sha256sums=('1990b66dfd48b1e6f5bcf14b12fa06bffa047ce486b6a5acfdb9b6845721f73c'
            'dbc3c7b9f55c9230e503fcafce4a0453fbbcfcca2e598f74e5fb29b538671402')

package() {
  cp -aR opt/ "${pkgdir}/"
  rm -rf usr/lib
  cd usr/share/icons/hicolor
  mv 0x0 512x512
  cd "${srcdir}"
  cp -aR usr/ "${pkgdir}/"
  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
