# Maintainer: Konstantin Gribov <grossws at gmail dot com>

pkgname=jib
pkgver=0.11.0
pkgrel=1
pkgdesc='Utility for reproducable builds of OCI or Docker container images'
arch=('any')
url="https://github.com/GoogleContainerTools/${pkgname}"
license=('Apache')
depends=('java-environment')
source=("https://github.com/GoogleContainerTools/${pkgname}/releases/download/v${pkgver}-cli/${pkgname}-jre-${pkgver}.zip"
        "jib")
sha256sums=('2bf35ea359fd6b9ec730a516380f82b76b93c0cb6dd791a9ae7384bdda389348'
            '6b97cf668f2a2af685d1bb97e8a1bedc4a090d828ccfc2e063fbce5a7c8e1172')

package() {
  install -m755 -D -t "${pkgdir}/usr/bin/" "${srcdir}/${pkgname}"
  install -m644 -D -t "${pkgdir}/usr/share/java/${pkgname}/" ${srcdir}/${pkgname}-${pkgver}/lib/*.jar
}

# vim:set ts=2 sw=2 et:

