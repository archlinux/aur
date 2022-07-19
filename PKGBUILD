# Maintainer: Markus Pesch <markus.pesch@cryptic.systems>

pkgname=docker-pushrm
pkgver=1.9.0
pkgrel=2
pkgdesc='"Docker Push Readme" - a Docker CLI plugin to update container repo docs'
arch=('x86_64')
url=https://github.com/christian-korneck/docker-pushrm
license=('MIT')
makedepends=('go')
source=("https://github.com/christian-korneck/docker-pushrm/archive/v${pkgver}.zip")
sha512sums=('aef19964c740b4d9b512b696759cd4b31793ced91f066864e534242d74694a796ee9930a809c2b5a6779238e32572642ab05fa5a7f8cf1062d0a9dd5f40c52d8')

build() {
  cd ${srcdir}/${pkgname}-${pkgver} && go build
}

package() {
  install -D --mode=0755 "${srcdir}/${pkgname}-${pkgver}/${pkgname}" "${pkgdir}/usr/lib/docker/cli-plugins/${pkgname}"
  install -D --mode=0644 "${srcdir}/${pkgname}-${pkgver}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
