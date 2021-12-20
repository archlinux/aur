# Maintainer: Mohammadreza Abdollahzadeh <morealaz at gmail dot com>
# Contributor: Jonas Seibert <jonas+aur at seibert dot ninja>
# Contributor: Holger Rauch <holger dot rauch at posteo dot de>
pkgname=payara
pkgver=5.2021.10
pkgrel=1
pkgdesc="Jakarta EE (Java EE) & MicroProfile compatible application server for production and containerized deployments."
url="http://www.payara.fish/"
license=("CDDL" "GPL2")
depends=('java-environment>=11')
arch=("any")
options=(!strip)
source=("https://search.maven.org/remotecontent?filepath=fish/${pkgname}/distributions/${pkgname}/${pkgver}/${pkgname}-${pkgver}.zip"
        "payara.service")

sha256sums=('fb61921704f577e5a5e0089611ad2885e6fb765c11e9c8a3e0c8df1c741c37a3'
            'ffd73bddd3218a7c8ce6748cc73c77e84994faebed7f42285a9d81da351ecc2c')
sha512sums=('6d882030de728cb15cde62407323d273fd9fae605fece44f5cc8ad41c06e97f500acc7be5ef4688363158533424a90f6c1aa19d95916741faa51c530f9b7c67c'
            'c1a4d1f96357c8e8afd74a2e5eccbe0d319f3448485b3907e1a700320d1fb442dbfa18fb49231d1430ebd253034113101deeae22e003ac02033e7930962ae7ca')

package() {
	install -d ${pkgdir}/opt
	cp -r payara5 ${pkgdir}/opt/payara
	install -Dm 644 ${srcdir}/payara.service ${pkgdir}/usr/lib/systemd/system/payara.service
}
# vim:set ts=4 sw=4:
