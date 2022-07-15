# Maintainer: Egor Vorontsov <sdoregor@sdore.me>
# Contributor: Martijn Braam <martijn@brixit.nl>

_pkgbase=postprocessd
pkgname=${_pkgbase}-git
pkgver=0.1.2
pkgrel=1
pkgdesc="Queueing megapixels post-processor (git version)"
arch=(any)
url="https://git.sr.ht/~martijnbraam/postprocessd"
license=(GPL-3.0-only)
depends=(libexif libjpeg-turbo libtiff opencv libraw)
makedepends=(meson scdoc)
source=("git+$url")
sha256sums=('SKIP')

build() {
	cd "${srcdir}/${_pkgbase}"

	arch-meson . build
	meson compile -C build
}

package() {
	cd "${srcdir}/${_pkgbase}"

	meson install -C build --destdir "${pkgdir}"
}
