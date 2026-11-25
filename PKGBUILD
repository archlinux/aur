# Maintainer: Patrick Northon <northon_patrick3@yahoo.ca>

pkgname=kaori
pkgver=1.0.0
pkgrel=1
pkgdesc='Discover, download and read comics.'
url='https://github.com/riyaniii/Kaori'
license=('GPL-3.0-only')
depends=('python' 'libadwaita')
makedepends=('python-setuptools' 'python-build' 'python-installer' 'python-wheel' 'meson' 'blueprint-compiler')
arch=('any')
sha256sums=('719d12e131b79c797d1bc425f3c6dd2e9b73327c4022d56bd0f605044423bc72')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")

_srcdir="Kaori-${pkgver}"

build() {
	arch-meson "${_srcdir}" build
}

package() {
	depends+=('python-diskcache' 'python-gql' 'python-gobject' 'python-httpx' 'python-babel')

	meson install -C build --destdir "$pkgdir"
}
