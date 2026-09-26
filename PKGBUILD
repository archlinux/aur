# Maintainer: xifan <xifan2333@gmail.com>
pkgname=xrwm-bin
_pkgname=xrwm
pkgver=0.1.2
pkgrel=1
pkgdesc="A River 0.4 Wayland window manager inspired by river-classic with composable shell CLI configuration"
arch=('x86_64')
url="https://github.com/xifan2333/xrwm"
license=('GPL-3.0-only')
depends=('river' 'wayland' 'libxkbcommon')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
options=(!strip)
source_x86_64=("${_pkgname}-${pkgver}-x86_64.tar.gz::https://github.com/xifan2333/xrwm/releases/download/v0.1.2/xrwm-0.1.2-x86_64-unknown-linux-gnu.tar.gz")
sha256sums_x86_64=('430d608de9500f86aa1d70672ced17ef1e134b501d972cc82433f38d7417a084')

package() {
	cd "${srcdir}/xrwm-${pkgver}-x86_64-unknown-linux-gnu"

	install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
	install -Dm644 README.md "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
