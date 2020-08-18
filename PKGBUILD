# Maintainer: Mohammadreza Abdollahzadeh <morealaz at gmail dot com>

pkgname=glassfish
pkgver=6.0.0_M2_servlet5
pkgrel=1
pkgdesc="The Open Source Jakarta EE (Java EE) Reference Implementation."
url="https://github.com/eclipse-ee4j/glassfish"
license=("EPL")
depends=("java-environment=8")
arch=("any")
options=(!strip)
source=("${pkgname}-${pkgver//_/-}.zip::${url}/releases/download/${pkgver//_/-}/${pkgname}.zip"
        "${pkgname}.service")

sha256sums=('ab42efbbf6fa45f1db9f69cb3afa98f6f05b71113d265fc83034c31bc23d2318'
            '7dbfedd1bdd3e040e91f89f8b6895117db3fda0fac774d2fdd8d55e4f602afa6')

package() {
	install -d "${pkgdir}/opt/${pkgname}"
	cp -a glassfish6/* "${pkgdir}/opt/${pkgname}"
	install -D ${pkgname}.service "${pkgdir}/usr/lib/systemd/system/${pkgname}.service"
}
# vim:set ts=4 sw=4:
