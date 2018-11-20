# Maintainer: smooz <smooz at mailbox dot org>
# Contributor: Dunon <josep.oliver at tutanota dot com>

pkgname=grevis
pkgver=0.1.3
pkgrel=1
pkgdesc='A simple game launcher'
arch=('any')
url='https://gitlab.gnome.org/dunon/grevis'
license=('GPL3')
depends=('python' 'gtk3')
makedepends=('meson' 'ninja')
conflicts=('grevis-git')
source=("https://gitlab.gnome.org/dunon/grevis/-/archive/${pkgver}/grevis-${pkgver}.tar.gz")
md5sums=('beac6226cd65dcf459c892d2c90ec324')

package() {
	cd "grevis-${pkgver}"
	meson builddir --prefix="/usr"
	DESTDIR="$pkgdir" ninja -C builddir install
}