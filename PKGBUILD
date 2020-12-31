# Maintainer: Mohammadreza Abdollahzadeh <morealaz at gmail dot com>

pkgname=glassfish
pkgver=6.0.0
pkgrel=1
pkgdesc="The Open Source Jakarta EE (Java EE) Reference Implementation."
url="https://github.com/eclipse-ee4j/glassfish"
license=("EPL")
depends=("java-environment=8")
arch=("any")
options=(!strip)
source=("https://github.com/eclipse-ee4j/${pkgname}/releases/download/${pkgver//_/-}/${pkgname}-${pkgver//_/-}.zip"
        "${pkgname}.service")

sha256sums=('a528811169e2c97d13618c1985bf6a70160e251b1b8a68bb22d43d9ee367e2e0'
            '7dbfedd1bdd3e040e91f89f8b6895117db3fda0fac774d2fdd8d55e4f602afa6')

package() {
	install -d "${pkgdir}/opt/${pkgname}"
	cp -a glassfish6/* "${pkgdir}/opt/${pkgname}"
	install -D ${pkgname}.service "${pkgdir}/usr/lib/systemd/system/${pkgname}.service"
}
# vim:set ts=4 sw=4:
