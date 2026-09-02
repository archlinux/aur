# Maintainer: Konstantin Gribov <grossws at gmail dot com>

pkgname=jib
pkgver=0.13.0
pkgrel=1
pkgdesc='Utility for reproducable builds of OCI or Docker container images'
arch=('any')
url="https://github.com/GoogleContainerTools/${pkgname}"
license=('Apache')
depends=('java-environment')
source=("https://github.com/GoogleContainerTools/${pkgname}/releases/download/v${pkgver}-cli/${pkgname}-jre-${pkgver}.zip"
        "jib")
sha256sums=('e8f6a4766221e6d3817226b8ee14792c4553e5605e79a48558f0d3bef21e0461'
            '6b97cf668f2a2af685d1bb97e8a1bedc4a090d828ccfc2e063fbce5a7c8e1172')

package() {
  install -m755 -D -t "${pkgdir}/usr/bin/" "${srcdir}/${pkgname}"
  install -m644 -D -t "${pkgdir}/usr/share/java/${pkgname}/" ${srcdir}/${pkgname}-${pkgver}/lib/*.jar
}

# vim:set ts=2 sw=2 et:

