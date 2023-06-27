# Contributor: navigaid <navigaid@gmail.com>

pkgname=devdash
pkgver=0.5.0
pkgrel=1
pkgdesc='Highly Configurable Terminal Dashboard for Developers'
arch=('x86_64' 'i686' 'armv6h' 'armv7h' 'aarch64')
url='https://github.com/Phantas0s/devdash'
license=('Apache')
makedepends=('go')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/Phantas0s/devdash/archive/v${pkgver}.tar.gz")
b2sums=('d3a7af042f3deb25d88d27be76ed61f0')


build() {
  cd ${pkgname}-${pkgver}
  go build
}

package() {
  cd ${pkgname}-${pkgver}
  install -Dm755 ${pkgname} "${pkgdir}/usr/bin/${pkgname}"
  install -Dm644 LICENCE "${pkgdir}/usr/share/licenses/${pkgname}/LICENCE"
  install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}

# vim:set ts=2 sw=2 et:
