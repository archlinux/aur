# Maintainer: LightDot <lightdot -a-t- g m a i l>

pkgname=enlightenment-arc-theme
pkgver=0.5.2
pkgrel=1
pkgdesc="A flat theme for Enlightenment"
arch=('any')
url="https://github.com/lightdot/${pkgname}"
license=('GPL3')
depends=('efl')
makedepends=('git' 'efl')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/lightdot/${pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('6eb1cc688120b91c7478ddc0c09c46bcdd92ac047c0f2e224ea25741f6a0e15d')

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	make orig-theme
	make all
}

package() {
	install -Dm644 "${srcdir}/${pkgname}-${pkgver}/arc.edj" "$pkgdir"/usr/share/elementary/themes/arc.edj
	install -Dm644 "${srcdir}/${pkgname}-${pkgver}/arc-dark.edj" "$pkgdir"/usr/share/elementary/themes/arc-dark.edj
	# install -Dm644 "${srcdir}/${_gitname}/arc-darker.edj" "$pkgdir"/usr/share/elementary/themes/arc-darker.edj
}
