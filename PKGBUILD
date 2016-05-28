# Maintainer: Gordian Edenhofer <gordian.edenhofer@gmail.com>

pkgname=fakepkg
pkgver=1.40.2
pkgrel=1
pkgdesc="A tool to reassemble installed packages from its deliverd files. It comes in handy if there is no internet connection available and you have no access to an up-to-date package cache."
arch=('any')
license=('GPL2')
url="https://github.com/Edenhofer/fakepkg"
depends=('bash>=4.2' 'pacman' 'tar' 'xz' 'gzip' 'sed' 'awk')
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/Edenhofer/fakepkg/archive/v${pkgver}.tar.gz")
md5sums=('f3b6ec80226d5ce3b041a0461ed009ac')

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"

	install -D -m755 "${pkgname}"       "${pkgdir}/usr/bin/${pkgname}"
	install -D -m644 "man/${pkgname}.1" "${pkgdir}/usr/share/man/man1/${pkgname}.1"
}
