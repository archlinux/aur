# Maintainer: Ryan Cragun <me@ryan.ec>
pkgname=gojira
_version='0.4.0'
pkgver="v${_version}"
pkgrel=1
pkgdesc="Gojira is a multi-purpose tool to ease development and testing of Kong by using Docker containers"
arch=('x86_64')
url='https://github.com/Kong/gojira'
license=('Apache')
provides=('gojira')
conflicts=('gojira')
depends=('docker' 'docker-compose')
source=("https://github.com/Kong/gojira/archive/${pkgver}.tar.gz")
sha256sums=('cf3f8d9f8a1e6e37664dd84bd6bd6fdc762ddfd345ca82f28d2ecc369e076473')

build() {
  return 0
}

package() {
  mkdir -p "${pkgdir}/usr/bin"
  mkdir -p "${pkgdir}/usr/lib"
  cp -R "${srcdir}/${pkgname}-${_version}" "${pkgdir}/usr/lib/gojira"
  ln -rs "${pkgdir}/usr/lib/gojira/gojira.sh" "${pkgdir}/usr/bin/gojira"
}
