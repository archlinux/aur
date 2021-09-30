# Maintainer: Mohammadreza Abdollahzadeh <morealaz at gmail dot com>
# Contributor: Jonas Seibert <jonas+aur at seibert dot ninja>
# Contributor: Holger Rauch <holger dot rauch at posteo dot de>

pkgname=payara
pkgver=5.2021.7
pkgrel=1
pkgdesc="Jakarta EE (Java EE) & MicroProfile compatible application server for production and containerized deployments."
url="http://www.payara.fish/"
license=("CDDL" "GPL2")
depends=("java-environment>=8")
arch=("any")
options=(!strip)
source=("https://search.maven.org/remotecontent?filepath=fish/${pkgname}/distributions/${pkgname}/${pkgver}/${pkgname}-${pkgver}.zip"
        "payara.service")

sha256sums=('13db90d934f64da2adc8ef19bea68850e45879b7587f8dc7f30fb08f078c9f75'
            'ffd73bddd3218a7c8ce6748cc73c77e84994faebed7f42285a9d81da351ecc2c')
sha512sums=('fa718e121567b37ecab88876bdd3c6dec65f1845c4cb3f28238d77d13f47965ae27d289823224fb1d4b3edc1a052e444c2731b90677f4934dcce606805df6578'
            'c1a4d1f96357c8e8afd74a2e5eccbe0d319f3448485b3907e1a700320d1fb442dbfa18fb49231d1430ebd253034113101deeae22e003ac02033e7930962ae7ca')

package() {
	install -d ${pkgdir}/opt
	cp -r payara5 ${pkgdir}/opt/payara
	install -Dm 644 ${srcdir}/payara.service ${pkgdir}/usr/lib/systemd/system/payara.service
}
# vim:set ts=4 sw=4:
