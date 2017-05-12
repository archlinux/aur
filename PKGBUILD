# Maintainer: ava1ar <mail(at)ava1ar(dot)me>

pkgname=airtame-application
pkgver=2.3.4
pkgrel=1
pkgdesc="Airtame official screen streaming application."
arch=('x86_64')
url="http://www.airtame.com"
license=('Custom')
source=('airtame.desktop' "https://downloads.airtame.com/application/ga/lin_x64/releases/airtame-application-${pkgver}.tar.gz")
sha1sums=('6cf4bf96ee176e84700514b22a6c7811e21136b4'
          'ad7c71070c9041d188dce338ad2a52e3a474d760')
package() {
	# Install files to /opt
    mkdir -p ${pkgdir}/opt/airtame
    mv ${srcdir}/${pkgname}-${pkgver}/* ${pkgdir}/opt/airtame
	# Install desktop file
	install -m 644 -D "${startdir}"/airtame.desktop "${pkgdir}"/usr/share/applications/airtame.desktop
	# Installing license
	install -m 644 -D ${pkgdir}/opt/airtame/LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}
