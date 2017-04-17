# Maintainer: yhaupenthal <y dot h plus aur at posteo dot de>
pkgname=multipass
pkgver='17.04'
pkgrel=1
pkgdesc='Broadcast X11 key events to multiple windows'
arch=('any')
url='https://github.com/vain/multipass'
license=('custom:THE PIZZA-WARE LICENSE')
depends=('libx11' 'libxft')
makedepends=('git')
source=("https://github.com/vain/${pkgname}/archive/v${pkgver}.tar.gz"
        "https://raw.githubusercontent.com/vain/${pkgname}/master/LICENSE")
sha256sums=('b0c261da4f96bc8c058fd5360c75eea5c97564622b8b17709dfc6bff0125713d'
            '6e228076a81b8d23d885a2831cc04b30277d7eaea69cf792902c51a92c72f57b')
build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make
}
package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  install -D -m 644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -D -m 755 "${srcdir}/${pkgname}-${pkgver}/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
}
