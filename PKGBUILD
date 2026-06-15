# Maintainer: René Wagner <rwa at clttr dot info>
pkgname=art-rawconverter-imageio
pkgver=1.1.6
pkgrel=1
epoch=1
pkgdesc='add on for ART raw converter to support more image formats'
arch=('any')
url='https://github.com/artpixls/ART-imageio/'
license=('GPL-3.0-only')
depends=('art-rawconverter' 'python-pillow' 'libwebp' 'libjxl' 'python-numpy' 'python-tifffile' 'perl-image-exiftool' 'siril' 'libavif')
makedepends=('pkgconf' 'git' 'fakeroot')
source=("${pkgname}-${pkgver}::https://github.com/artraweditor/ART-imageio/archive/refs/tags/${pkgver}.tar.gz")
prepare() {
	rm -rf "${srcdir}/ART-imageio-${pkgver}/.gitignore"
	rm -rf "${srcdir}/ART-imageio-${pkgver}/.git/"
}

package() {
	mkdir -p "${pkgdir}/usr/share/ART/imageio/"
	cd "${srcdir}/ART-imageio-${pkgver}"
	find . -type f -exec install -Dm 755 "{}" "${pkgdir}/usr/share/ART/imageio/{}" \;
}
sha256sums=('20b743f03341f1f2a2237c2aacc5d00b48adade0ce19dd9451f593c70a143324')
