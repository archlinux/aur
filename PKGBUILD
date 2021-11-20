# Maintainer: Mohammadreza Abdollahzadeh <morealaz at gmail dot com>
# Contributor: Jonas Seibert <jonas+aur at seibert dot ninja>
# Contributor: Holger Rauch <holger dot rauch at posteo dot de>
pkgname=payara
pkgver=5.2021.9
pkgrel=1
pkgdesc="Jakarta EE (Java EE) & MicroProfile compatible application server for production and containerized deployments."
url="http://www.payara.fish/"
license=("CDDL" "GPL2")
depends=('java-environment>=11')
arch=("any")
options=(!strip)
source=("https://search.maven.org/remotecontent?filepath=fish/${pkgname}/distributions/${pkgname}/${pkgver}/${pkgname}-${pkgver}.zip"
        "payara.service")

sha256sums=('cc8d45525efec5303c2b8b394cb456bf48b7217d800b48e97901a6aea1049540'
            'ffd73bddd3218a7c8ce6748cc73c77e84994faebed7f42285a9d81da351ecc2c')
sha512sums=('fe1574ead76fe5bc6547eb85637fbb47ccd969d949c37ba9775bc12bae4f2933469a1440deec67a29c9ce7e1f7176d62d41c10fb6e4d9dd0d33c5ac7b6a6bf46'
            'c1a4d1f96357c8e8afd74a2e5eccbe0d319f3448485b3907e1a700320d1fb442dbfa18fb49231d1430ebd253034113101deeae22e003ac02033e7930962ae7ca')

package() {
	install -d ${pkgdir}/opt
	cp -r payara5 ${pkgdir}/opt/payara
	install -Dm 644 ${srcdir}/payara.service ${pkgdir}/usr/lib/systemd/system/payara.service
}
# vim:set ts=4 sw=4:
