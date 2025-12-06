# Maintainer & Owner: johannesjo <contact@super-productivity.com>
# Maintainer: José Miguel Sarasola <jmsaraur@gmail.com>

_pkgname='superproductivity'
pkgname="${_pkgname}-bin"
pkgver=16.5.3
pkgrel=1
pkgdesc="ToDo list and Time Tracking"
arch=('x86_64')
url="http://super-productivity.com/"
license=('MIT')
depends=('gtk3' 'nss')
provides=("${_pkgname}")
conflicts=("${_pkgname}"
		   "${_pkgname}-git")
source=("superproductivity-${pkgver}-amd64.deb::https://github.com/johannesjo/super-productivity/releases/download/v${pkgver}/superProductivity-amd64.deb")
sha256sums=('30655e9483adfcc5d89772f2e519fb94b39b95a5df179d59e07974841ca28feb')

package() {
	tar -xvf data.tar.xz -C "${pkgdir}"
	rm -rf "${pkgdir}/usr/share/doc"
    install -d "${pkgdir}/usr/bin"
	ln -sf "/opt/Super Productivity/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
    install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" \
    "${pkgdir}/opt/Super Productivity/"{'LICENSE.electron.txt','LICENSES.chromium.html'}
}
