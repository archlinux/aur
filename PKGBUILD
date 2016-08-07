# Maintainer: ava1ar <mail(at)ava1ar(dot)me>

pkgname=airtame-application
pkgver=2.0.3
pkgrel=1
pkgdesc="Stream your display to an airtame dongle."
arch=('x86_64')
url="http://www.airtame.com"
license=('Custom')
source=('airtame.desktop' "https://downloads.airtame.com/application/ga/lin_x64/releases/airtame-application_${pkgver}.tar.gz")
sha1sums=('6cf4bf96ee176e84700514b22a6c7811e21136b4'
          '40c76a3db7e5a0b93be7f656907107ec73039f40')
package() {
	# Install files to /opt
    mkdir -p ${pkgdir}/opt/airtame
    mv ${srcdir}/${pkgname}_${pkgver}/* ${pkgdir}/opt/airtame
	# Install desktop file
	install -m 644 -D "${startdir}"/airtame.desktop "${pkgdir}"/usr/share/applications/airtame.desktop
	# Installing license
	install -m 644 -D ${pkgdir}/opt/airtame/LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}
