# Maintainer: yhaupenthal <y dot h plus aur at posteo dot de>
pkgname=multipass
pkgver='17.09'
pkgrel=2
pkgdesc='Broadcast X11 key events to multiple windows'
arch=('any')
url='https://github.com/vain/multipass'
license=('MIT')
depends=('libx11' 'libxft')
makedepends=('git')
source=("https://github.com/vain/${pkgname}/archive/v${pkgver}.tar.gz"
        "https://raw.githubusercontent.com/vain/${pkgname}/master/LICENSE")
sha256sums=('001f760bde3392e9289f03987c2a5dbc61e8adcc4b575cfad96da88b28ba18fe'
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
