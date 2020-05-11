# Maintainer: Marcel Korpel <marcel dot korpel at gmail>
# Contributor: Mohammadreza Abdollahzadeh <morealaz at gmail dot com>

pkgname=glassfish5
pkgver=5.1.0
pkgrel=3
pkgdesc="The Open Source Jakarta EE 8 (Java EE 8) Reference Implementation."
url="https://github.com/eclipse-ee4j/glassfish"
license=("EPL")
depends=("java-environment>=8")
arch=("any")
options=(!strip)
source=("glassfish-${pkgver}.zip::https://www.eclipse.org/downloads/download.php?file=/glassfish/glassfish-${pkgver}.zip&r=1"
        "${pkgname}.service")

sha256sums=('26f3fa6463d24c5ed3956e4cab24a97e834ca37d7a23d341aadaa78d9e0093ce'
            '9be6b53df62a719e4cac1b54703f0abcc6c22389d1b46e3e85ed38d6f1453cdc')

package() {
  install -d ${pkgname} "${pkgdir}/opt/${pkgname}"
  cp -a glassfish5 "${pkgdir}/opt/"
  chmod -R o=g "${pkgdir}/opt/"
  install -D ${pkgname}.service "${pkgdir}/usr/lib/systemd/system/glassfish5.service"
}
# vim:set ts=2 sw=2 et:
