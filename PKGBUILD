# Maintainer: Konstantin Gribov <grossws at gmail dot com>

pkgname=jib
pkgver=0.10.0
pkgrel=1
pkgdesc='Utility for reproducable builds of OCI or Docker container images'
arch=('any')
url="https://github.com/GoogleContainerTools/${pkgname}"
license=('Apache')
depends=('java-environment')
source=("https://github.com/GoogleContainerTools/${pkgname}/releases/download/v${pkgver}-cli/${pkgname}-jre-${pkgver}.zip"
        "jib")
sha256sums=('1b48fd04e73573bbf902c85dc1019c38ea4968dc0dbac4eb0658a2650ca5a18e'
            '3e38b0935f882bf5d709b6f06d12fb529ea506948a0d1f94abd9f45bb1544d33')

package() {
  install -m755 -D -t "${pkgdir}/usr/bin/" "${srcdir}/${pkgname}"
  install -m644 -D -t "${pkgdir}/usr/share/java/${pkgname}/" ${srcdir}/${pkgname}-${pkgver}/lib/*.jar
}

# vim:set ts=2 sw=2 et:

