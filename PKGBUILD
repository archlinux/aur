# Maintainer: Gordian Edenhofer <gordian.edenhofer@gmail.com>

pkgname=fakepkg
pkgver=1.41.1
pkgrel=1
pkgdesc="Tool to reassemble installed packages from its deliverd files. It comes in handy if there is no internet connection available and you have no access to an up-to-date package cache"
arch=('any')
license=('GPL2')
url="https://github.com/Edenhofer/fakepkg"
depends=('bash>=4.2' 'pacman' 'tar' 'xz' 'gzip' 'sed' 'awk')
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/Edenhofer/fakepkg/archive/v${pkgver}.tar.gz")
sha512sums=('9142b133783f6de16f7287d2dd756a6dfb3756287821c7be2a4bfc48179f694ae5320874553f11f28f9150b2325e3c61df44d27a5e4f66aa27bc1759bcd4b310')

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"

	install -D -m755 "${pkgname}"       "${pkgdir}/usr/bin/${pkgname}"
	install -D -m644 "man/${pkgname}.1" "${pkgdir}/usr/share/man/man1/${pkgname}.1"
}
