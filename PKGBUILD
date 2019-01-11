# Maintainer: Gordian Edenhofer <gordian.edenhofer@gmail.com>

pkgname=fakepkg
pkgver=1.41.0
pkgrel=1
pkgdesc="Tool to reassemble installed packages from its deliverd files. It comes in handy if there is no internet connection available and you have no access to an up-to-date package cache"
arch=('any')
license=('GPL2')
url="https://github.com/Edenhofer/fakepkg"
depends=('bash>=4.2' 'pacman' 'tar' 'xz' 'gzip' 'sed' 'awk')
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/Edenhofer/fakepkg/archive/v${pkgver}.tar.gz")
sha512sums=('d611554727104ebece6b154b0c6477465500c3f6fc0b9a4d5d92fdbf68f42ab77567c0799e62a7582324a1e85738098da872fda2d3061000d10b925c6bb566d3')

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"

	install -D -m755 "${pkgname}"       "${pkgdir}/usr/bin/${pkgname}"
	install -D -m644 "man/${pkgname}.1" "${pkgdir}/usr/share/man/man1/${pkgname}.1"
}
