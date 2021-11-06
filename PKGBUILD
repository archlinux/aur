# Maintainer: Mohammadreza Abdollahzadeh <morealaz at gmail dot com>
# Contributor: Jonas Seibert <jonas+aur at seibert dot ninja>
# Contributor: Holger Rauch <holger dot rauch at posteo dot de>
pkgname=payara
pkgver=5.2021.8
pkgrel=2
pkgdesc="Jakarta EE (Java EE) & MicroProfile compatible application server for production and containerized deployments."
url="http://www.payara.fish/"
license=("CDDL" "GPL2")
depends=('java-environment>=11')
arch=("any")
options=(!strip)
source=("https://search.maven.org/remotecontent?filepath=fish/${pkgname}/distributions/${pkgname}/${pkgver}/${pkgname}-${pkgver}.zip"
        "payara.service")

sha256sums=('64ebb1ac3507afd4fa6daa2c3735e964889faee816f10c8775ba09e8166c9ce1'
            'ffd73bddd3218a7c8ce6748cc73c77e84994faebed7f42285a9d81da351ecc2c')
sha512sums=('1fdc01dab5e66c7ed72baaa6aa14d0ccb137892b29a7dbab6b5b659971f4dc46357e59e6b7a90be86d822e4799dcc75bdfb938162b9e941d3131c1744c512956'
            'c1a4d1f96357c8e8afd74a2e5eccbe0d319f3448485b3907e1a700320d1fb442dbfa18fb49231d1430ebd253034113101deeae22e003ac02033e7930962ae7ca')

package() {
	install -d ${pkgdir}/opt
	cp -r payara5 ${pkgdir}/opt/payara
	install -Dm 644 ${srcdir}/payara.service ${pkgdir}/usr/lib/systemd/system/payara.service
}
# vim:set ts=4 sw=4:
