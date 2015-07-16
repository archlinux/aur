# Maintainer: Arnoud Willemsen <mail@lynthium.com>

pkgname='clevo-xsm-wmi-util'
pkgver='0.4'
_pkgtag='ea6d0253b59f'
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
md5sums=('9a9b35fcf80113cf0b4a551bbf73ea59')
