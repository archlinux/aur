# Maintainer: yhaupenthal <y dot h plus aur at posteo dot de>
pkgname=multipass
pkgver='17.09'
pkgrel=1
pkgdesc='Broadcast X11 key events to multiple windows'
arch=('any')
url='https://github.com/vain/multipass'
license=('MIT')
depends=('libx11' 'libxft')
makedepends=('git')
source=("https://github.com/vain/${pkgname}/archive/v${pkgver}.tar.gz"
        "https://raw.githubusercontent.com/vain/${pkgname}/master/LICENSE")
sha256sums=('001f760bde3392e9289f03987c2a5dbc61e8adcc4b575cfad96da88b28ba18fe'
            '4dfb13f42798666f371971f34e4be34a23a045e48a922cf291e018709a01060f')
build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make
}
package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  install -D -m 644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -D -m 755 "${srcdir}/${pkgname}-${pkgver}/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
}
