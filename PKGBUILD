# Maintainer: Arnoud Willemsen <mail@lynthium.com>

pkgname='clevo-xsm-wmi-util'
pkgver='0.7'
_pkgtag='61253d26e784'
pkgrel=1
pkgdesc='A GUI control utility for the clevo-xsm-wmi driver.'
arch=('i686' 'x86_64')
license=('GPL')
url='https://bitbucket.org/lynthium/clevo-xsm-wmi'
source=("clevo-xsm-wmi-${pkgver}.src.tar.gz::https://bitbucket.org/lynthium/clevo-xsm-wmi/get/v${pkgver}.tar.gz")
options=(!emptydirs)
depends=('clevo-xsm-wmi' 'qt5-base')

build() {
	cd "${srcdir}/lynthium-clevo-xsm-wmi-${_pkgtag}/utility"
	qmake && make
}
package() {
	cd "${srcdir}/lynthium-clevo-xsm-wmi-${_pkgtag}/utility"

	install -Dm755 clevo-xsm-wmi ${pkgdir}/usr/bin/clevo-xsm-wmi
	install -Dm755 systemd/clevo-xsm-wmi.service ${pkgdir}/usr/lib/systemd/system/clevo-xsm-wmi.service
	install -D -m644 /usr/share/licenses/common/GPL2/license.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
sha256sums=('7da2298142061bde605c0e7e9aa5905f30a7a2f0d47c2786dc392c33803a743e')
