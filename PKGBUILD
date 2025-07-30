# Maintainer: René Wagner <rwa at clttr dot info>
pkgname=art-rawconverter-imageio
pkgver=1.1.1
pkgrel=1
pkgdesc='add on for ART raw converter to support more image formats'
arch=('i686' 'x86_64' 'aarch64')
url='https://github.com/artpixls/ART-imageio/'
license=('GPL3')
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
sha256sums=('ce6de6aaabbada878cdb354647d80c898cce8088b0f9ea04f3fea687a6e3fe09')
