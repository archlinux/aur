# Maintainer: René Wagner <rwa at clttr dot info>
pkgname=art-rawconverter-imageio
pkgver=1.1.2
pkgrel=1
epoch=1
pkgdesc='add on for ART raw converter to support more image formats'
arch=('any')
url='https://github.com/artpixls/ART-imageio/'
license=('GPL-3.0-only')
depends=('art-rawconverter' 'python-pillow' 'libwebp' 'libjxl' 'python-numpy' 'python-tifffile' 'python-openexr' 'perl-image-exiftool' 'siril' 'libavif')
makedepends=('pkgconf' 'git' 'fakeroot')
source=("${pkgname}::https://github.com/artpixls/ART-imageio/archive/refs/tags/${pkgver}.tar.gz")

prepare() {
	rm -rf "${srcdir}/ART-imageio-${pkgver}/.gitignore"
	rm -rf "${srcdir}/ART-imageio-${pkgver}/.git/"
}

package() {
	mkdir -p "${pkgdir}/usr/share/ART/imageio/"
	cd "${srcdir}/ART-imageio-${pkgver}"
	find . -type f -exec install -Dm 755 "{}" "${pkgdir}/usr/share/ART/imageio/{}" \;
}
sha256sums=('56443d2b7dc8fa19a1e8441a809d5ad85d525931c8cd173cba1cedfb91f4e6b0')
