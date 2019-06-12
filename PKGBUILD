# Maintainer: Adrian Perez de Castro <aperez@igalia.com>
pkgdesc=''
pkgname=gtk-theme-adementary
pkgver=201905r1
pkgrel=1
url='https://github.com/hrdwrrsk/adementary-theme'
arch=(any)
license=(GPL3)
depends=()
makedepends=(git bash)
source=("${pkgname}::git+${url}?tag=${pkgver}")
sha512sums=(SKIP)

package () {
	cd "${pkgname}"
	install -dm755 "${pkgdir}/usr/share/themes"
	./install.sh --dest "${pkgdir}/usr/share/themes"

	# Clean installed shell scripts
	find "${pkgdir}/usr/share/themes" -name '*.sh' -delete
}
