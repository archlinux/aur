# Maintainer & Owner: johannesjo <contact@super-productivity.com>
# Maintainer: José Miguel Sarasola <jmsaraur@gmail.com>

_pkgname='superproductivity'
pkgname="${_pkgname}-bin"
pkgver=17.0.2
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
sha256sums=('a7d888899cd0f3548f4d61dcf3749bfd5236e2b535a6571eb690d3f280f4e00a')

package() {
	tar -xvf data.tar.xz -C "${pkgdir}"
	rm -rf "${pkgdir}/usr/share/doc"
    install -d "${pkgdir}/usr/bin"
	ln -sf "/opt/Super Productivity/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
    install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" \
    "${pkgdir}/opt/Super Productivity/"{'LICENSE.electron.txt','LICENSES.chromium.html'}
}
