# Maintainer: René Wagner <rwa at clttr dot info>
pkgname=art-rawconverter-imageio
pkgver=1.1
pkgrel=1
epoch=1
pkgdesc="add on for ART raw converter to support more image formats"
arch=('i686' 'x86_64' 'aarch64')
url="https://art.pixls.us"
license=('GPL3')
depends=('art-rawconverter' 'python-pillow' 'libwebp' 'libjxl' 'python-numpy' 'python-tifffile' 'python-openexr' 'perl-image-exiftool' 'siril' 'libavif')
makedepends=('pkgconf' 'git' 'fakeroot')
source=("${pkgname}::git+https://github.com/artpixls/art-imageio.git#tag=${pkgver}")
sha256sums=('SKIP')

prepare() {
	rm -rf "${srcdir}/${pkgname}/.gitignore"
	rm -rf "${srcdir}/${pkgname}/.git/"
}

package() {
	mkdir -p "${pkgdir}/usr/share/ART/imageio/"
	cd "${srcdir}/${pkgname}"
	find . -type f -exec install -Dm 755 "{}" "${pkgdir}/usr/share/ART/imageio/{}" \;
}
