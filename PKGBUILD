# Maintainer: Markus Pesch <markus.pesch@cryptic.systems>

pkgname=docker-pushrm
pkgver=1.7.0
pkgrel=1
pkgdesc='"Docker Push Readme" - a Docker CLI plugin to update container repo docs'
arch=('any')
url=https://github.com/christian-korneck/docker-pushrm
license=('MIT')
makedepends=('go')
source=("https://github.com/christian-korneck/docker-pushrm/archive/v${pkgver}.zip")
sha512sums=('887457138add4aebd5ddd32318b4c0c0bfa1a4c372edf1c52277ba3c4ef02cdc578406e3062fe65b9cbe323ea19cf14e2f75fc447e8733f4cae9f2fea1ec5ecc')

build() {
  cd ${srcdir}/${pkgname}-${pkgver} && go build
}

package() {
  mkdir --parents /usr/lib/docker/cli-plugins
  install -D --mode=0755 "${srcdir}/${pkgname}-${pkgver}/${pkgname}" "${pkgdir}/usr/lib/docker/cli-plugins/${pkgname}"
  install -D --mode=0644 "${srcdir}/${pkgname}-${pkgver}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
