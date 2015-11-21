# Maintainer: Arnoud Willemsen <mail@lynthium.com>

pkgname='clevo-xsm-wmi-util'
pkgver='0.6'
_pkgtag='291801cb8d85'
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
sha256sums=('7619a39cbd2445e947a348b27737c41fc7d3f11bd7f15e52a89e2cd310a03698')
