# Maintainer: Pellegrino Prevete <pellegrinoprevete@gmail.com>
# Contributor: Gordian Edenhofer <gordian.edenhofer@gmail.com>

# shellcheck disable=SC2034
_pkgname=fakepkg
pkgname="${_pkgname}-git"
pkgver=1.42.0
pkgrel=1
pkgdesc="Tool to reassemble installed packages from its deliverd files. It comes in handy if there is no internet connection available and you have no access to an up-to-date package cache"
arch=('any')
license=('GPL2')
url="https://github.com/Edenhofer/fakepkg"
_url="https://gitlab.archlinux.org/tallero/${_pkgname}"
depends=('bash>=4.2' 'pacman' 'tar' 'gzip' 'sed' 'awk')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("${_pkgname}-${pkgver}.tar.gz::${_url}/archive/v${pkgver}.tar.gz")
sha512sums=('a0cbced9fa2c15114881ed71915671141b91efdf265a851a35013dfa1e34be328c80f47cabcb9e04262baa1a32e6f4e47a893cc7af0eb1b2dc4190712667f4b6')

package() {
	cd "${srcdir}/${_pkgname}-${pkgver}"

	install -D -m755 "${_pkgname}"       "${pkgdir}/usr/bin/${_pkgname}"
	install -D -m644 "man/${_pkgname}.1" "${pkgdir}/usr/share/man/man1/${_pkgname}.1"
}
