# Maintainer: René Wagner <rwa at clttr dot info>
pkgname=art-rawconverter-imageio
pkgver=20221226
pkgrel=1
pkgdesc="add on for ART raw converter to support more image formats"
arch=('i686' 'x86_64' 'aarch64')
url="https://bitbucket.org/agriggio/art-imageio/src/main/"
license=('GPL3')
depends=('art-rawconverter' 'python-pillow' 'libwebp' 'libjxl' 'python-numpy' 'python-tifffile' 'python-exiv2' 'python-openexr' 'perl-image-exiftool' 'siril' 'libavif')
makedepends=('pkgconf' 'git' 'fakeroot')
source=("${pkgname}_${pkgver}::git+https://bitbucket.org/agriggio/art-imageio.git")
sha256sums=('SKIP')

prepare() {
	rm -rf "${srcdir}/${pkgname}_${pkgver}/.gitignore"
	rm -rf "${srcdir}/${pkgname}_${pkgver}/.git/"
}

package() {
	mkdir -p "${pkgdir}/usr/share/ART/imageio/"
	cd "${srcdir}/${pkgname}_${pkgver}"
	find . -type f -exec install -Dm 755 "{}" "${pkgdir}/usr/share/ART/imageio/{}" \;
}
