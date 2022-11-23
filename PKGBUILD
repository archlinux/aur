# Maintainer: Egor Vorontsov <sdoregor@sdore.me>
# Contributor: Martijn Braam <martijn@brixit.nl>

pkgname=postprocessd
pkgver=0.2.1
pkgrel=1
pkgdesc="Queueing megapixels post-processor"
arch=('any')
url="https://git.sr.ht/~martijnbraam/postprocessd"
license=('GPL3')
depends=('libraw' 'libtiff' 'libjpeg-turbo' 'libexif' 'opencv')
makedepends=('meson' 'scdoc')
source=("${pkgname}-${pkgver}.tar.gz::https://git.sr.ht/~martijnbraam/postprocessd/archive/$pkgver.tar.gz")
sha256sums=('60b541ba4315a31b7ef21fe8bab27e964bad2a50c362601001a396ccd1d18f9e')

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"

	arch-meson . build
	meson compile -C build
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"

	meson install -C build --destdir "${pkgdir}"
}
