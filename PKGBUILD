# Maintainer: Adrian Perez de Castro <aperez@igalia.com>
pkgdesc='A theme for GNOME/Budgie/Xfce/Cinnamon desktop with elementary-ish aesthetics.'
pkgname=gtk-theme-adementary
pkgver=201905r1
pkgrel=5
url=https://github.com/hrdwrrsk/adementary-theme
arch=(any)
license=(GPL3)
depends=()
makedepends=(git bash sassc bc)
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz")
sha512sums=('489e77ff2fdea570c903acd66e2313543ab58acd51b8663e2f006cf518e70825c1dfcbdc2219a95e83e320fcf8debc14df3a6e416535ae6012ded43397f62d92')

package () {
	cd "adementary-theme-${pkgver}"
	install -dm755 "${pkgdir}/usr/share/themes"
	bash install.sh --dest "${pkgdir}/usr/share/themes"

	# Clean installed shell scripts
	find "${pkgdir}/usr/share/themes" -name '*.sh' -delete
}
