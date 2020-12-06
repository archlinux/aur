# Maintainer: Mohammadreza Abdollahzadeh <morealaz at gmail dot com>
pkgname=glassfish
pkgver=6.0.0_RC2
pkgrel=1
pkgdesc="The Open Source Jakarta EE (Java EE) Reference Implementation."
url="https://github.com/eclipse-ee4j/glassfish"
license=("EPL")
depends=("java-environment=8")
arch=("any")
options=(!strip)
source=("https://download.eclipse.org/ee4j/${pkgname}/${pkgname}-${pkgver//_/-}.zip"
        "${pkgname}.service")

sha256sums=('1e8ed1e7eddcdb2a9033bacd27b4106d485778607d65acf556df644d4fb0ebd2'
            '7dbfedd1bdd3e040e91f89f8b6895117db3fda0fac774d2fdd8d55e4f602afa6')

package() {
	install -d "${pkgdir}/opt/${pkgname}"
	cp -a glassfish6/* "${pkgdir}/opt/${pkgname}"
	install -D ${pkgname}.service "${pkgdir}/usr/lib/systemd/system/${pkgname}.service"
}
# vim:set ts=4 sw=4:
