# Maintainer: Konstantin Gribov <grossws at gmail dot com>

pkgname=jib
pkgver=0.12.0
pkgrel=1
pkgdesc='Utility for reproducable builds of OCI or Docker container images'
arch=('any')
url="https://github.com/GoogleContainerTools/${pkgname}"
license=('Apache')
depends=('java-environment')
source=("https://github.com/GoogleContainerTools/${pkgname}/releases/download/v${pkgver}-cli/${pkgname}-jre-${pkgver}.zip"
        "jib")
sha256sums=('2a7ad472df888fa77f0732820b52da34742e64dd0c67f1c5d8b8444ca0f6f061'
            '6b97cf668f2a2af685d1bb97e8a1bedc4a090d828ccfc2e063fbce5a7c8e1172')

package() {
  install -m755 -D -t "${pkgdir}/usr/bin/" "${srcdir}/${pkgname}"
  install -m644 -D -t "${pkgdir}/usr/share/java/${pkgname}/" ${srcdir}/${pkgname}-${pkgver}/lib/*.jar
}

# vim:set ts=2 sw=2 et:

