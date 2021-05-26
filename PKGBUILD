# Maintainer: Mohammadreza Abdollahzadeh <morealaz at gmail dot com>

pkgname=glassfish
pkgver=6.1.0
pkgrel=1
pkgdesc="The Open Source Jakarta EE (Java EE) Reference Implementation."
url="https://github.com/eclipse-ee4j/glassfish"
license=("EPL")
depends=("java-environment>=8")
arch=("any")
options=(!strip)
source=("https://github.com/eclipse-ee4j/${pkgname}/releases/download/${pkgver//_/-}/${pkgname}-${pkgver//_/-}.zip"
        "${pkgname}.service")

sha256sums=('2df29d6f1a0338fe56eec71e4556fdc23c5dc80d1893452b9c903c455750321b'
            '7dbfedd1bdd3e040e91f89f8b6895117db3fda0fac774d2fdd8d55e4f602afa6')

package() {
	install -d "${pkgdir}/opt/${pkgname}"
	cp -a glassfish6/* "${pkgdir}/opt/${pkgname}"
	install -D ${pkgname}.service "${pkgdir}/usr/lib/systemd/system/${pkgname}.service"
}
# vim:set ts=4 sw=4:
