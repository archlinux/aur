# Maintainer: Markus Pesch <markus.pesch@cryptic.systems>

pkgname=docker-pushrm
pkgver=1.8.1
pkgrel=1
pkgdesc='"Docker Push Readme" - a Docker CLI plugin to update container repo docs'
arch=('x86_64')
url=https://github.com/christian-korneck/docker-pushrm
license=('MIT')
makedepends=('go')
source=("https://github.com/christian-korneck/docker-pushrm/archive/v${pkgver}.zip")
sha512sums=('c1a339239fc51b83f9b9c3f2719700ceac5350686d0399576ca096e68ca9f83be807c3be1f8738862332395ab47e0d362a03dd7671b2116034f17fa6460719b2')

build() {
  cd ${srcdir}/${pkgname}-${pkgver} && go build
}

package() {
  mkdir --parents /usr/lib/docker/cli-plugins
  install -D --mode=0755 "${srcdir}/${pkgname}-${pkgver}/${pkgname}" "${pkgdir}/usr/lib/docker/cli-plugins/${pkgname}"
  install -D --mode=0644 "${srcdir}/${pkgname}-${pkgver}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
