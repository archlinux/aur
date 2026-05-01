# Maintainer & Owner: johannesjo <contact@super-productivity.com>
# Maintainer: José Miguel Sarasola <jmsaraur@gmail.com>

_pkgname='superproductivity'
pkgname="${_pkgname}-bin"
pkgver=18.4.3
pkgrel=1
pkgdesc="ToDo list and Time Tracking"
arch=('x86_64')
url="http://super-productivity.com/"
license=('MIT')
depends=('gtk3' 'nss')
provides=("${_pkgname}")
conflicts=("${_pkgname}"
		   "${_pkgname}-git")
source=("superproductivity-${pkgver}-amd64.deb::https://github.com/super-productivity/super-productivity/releases/download/v${pkgver}/superProductivity-amd64.deb")
sha256sums=('432a10a7d3f5c4a0cf14dc4b3903d2b31c3e986df01acb4c5420f22fe44261e5')

package() {
	tar -xvf data.tar.xz -C "${pkgdir}"
	rm -rf "${pkgdir}/usr/share/doc"
    install -d "${pkgdir}/usr/bin"
	ln -sf "/opt/Super Productivity/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
    install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" \
    "${pkgdir}/opt/Super Productivity/"{'LICENSE.electron.txt','LICENSES.chromium.html'}
}
