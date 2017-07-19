# Maintainer: Arnoud Willemsen <mail@lynthium.com>

pkgname='clevo-xsm-wmi-util'
pkgver='1.1'
_pkgtag='6bfe9fe44e04'
pkgrel=1
pkgdesc='A GUI control utility for the clevo-xsm-wmi driver.'
arch=('i686' 'x86_64')
license=('GPL')
url='https://bitbucket.org/tuxedocomputers/clevo-xsm-wmi'
source=("clevo-xsm-wmi-${pkgver}.src.tar.gz::https://bitbucket.org/tuxedocomputers/clevo-xsm-wmi/get/v${pkgver}.tar.gz")
options=(!emptydirs)
depends=('clevo-xsm-wmi' 'qt5-base')

build() {
	cd "${srcdir}/tuxedocomputers-clevo-xsm-wmi-${_pkgtag}/utility"
	qmake && make
}
package() {
	cd "${srcdir}/tuxedocomputers-clevo-xsm-wmi-${_pkgtag}/utility"

	install -Dm755 clevo-xsm-wmi ${pkgdir}/usr/bin/clevo-xsm-wmi
	install -Dm644 systemd/clevo-xsm-wmi.service ${pkgdir}/usr/lib/systemd/system/clevo-xsm-wmi.service
	install -D -m644 /usr/share/licenses/common/GPL2/license.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
sha256sums=('630ff6dbfa90c8a9285badf75b60579b2a9495e85862b62ef77a3654535e4b72')
