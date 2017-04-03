# Maintainer: yhaupenthal <y dot h plus aur at posteo dot de>
pkgname=multipass
pkgver='17.03.11'
pkgrel=1
pkgdesc='Broadcast X11 key events to multiple windows'
arch=('any')
url='https://github.com/vain/multipass'
license=('custom:THE PIZZA-WARE LICENSE')
depends=('libx11' 'libxft')
makedepends=('git')
source=("https://github.com/vain/${pkgname}/archive/v${pkgver}.tar.gz"
        "https://raw.githubusercontent.com/vain/${pkgname}/master/LICENSE")
sha256sums=('73e1a8739f2068c002e78c91acefdd416d29c1fffb73a4b1617e55bb3c517844'
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
