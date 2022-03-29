# Maintainer: Egor Vorontsov <sdoregor@sdore.me>
# Contributor: Martijn Braam <martijn@brixit.nl>

pkgname=postprocessd
pkgver=0.1.2
pkgrel=1
pkgdesc="Queueing megapixels post-processor"
arch=(any)
url="https://git.sr.ht/~martijnbraam/postprocessd"
license=(GPL-3.0-only)
depends=(libexif libjpeg-turbo libtiff opencv libraw)
makedepends=(meson scdoc)
source=("${pkgname}-${pkgver}.tar.gz::https://git.sr.ht/~martijnbraam/postprocessd/archive/$pkgver.tar.gz")
sha256sums=('a9d990ba0fd720fc63de469805c746ce1a0bb3a14545856ac430e2ee48aac40e')

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"

	arch-meson . build
	meson compile -C build
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"

	meson install -C build --destdir "${pkgdir}"
}
