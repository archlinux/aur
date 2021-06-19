# Maintainer: Mohammadreza Abdollahzadeh <morealaz at gmail dot com>

pkgname=glassfish
pkgver=6.2.0
pkgrel=1
pkgdesc="The Open Source Jakarta EE (Java EE) Reference Implementation."
url="https://github.com/eclipse-ee4j/glassfish"
license=("EPL")
depends=("java-environment>=8")
arch=("any")
options=(!strip)
source=("https://github.com/eclipse-ee4j/${pkgname}/releases/download/${pkgver//_/-}/${pkgname}-${pkgver//_/-}.zip"
        "${pkgname}.service")

sha256sums=('b09af3c4f331a88fa40a96e35bde871801beeb79ba2f774974b4257489842a3e'
            '7dbfedd1bdd3e040e91f89f8b6895117db3fda0fac774d2fdd8d55e4f602afa6')

package() {
	install -d "${pkgdir}/opt/${pkgname}"
	cp -a glassfish6/* "${pkgdir}/opt/${pkgname}"
	install -D ${pkgname}.service "${pkgdir}/usr/lib/systemd/system/${pkgname}.service"
}
# vim:set ts=4 sw=4:
