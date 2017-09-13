# Maintainer: Oleksandr Natalenko aka post-factum <oleksandr@natalenko.name>
_origname=fann
pkgname=lib${_origname}
_fullrev=d71d54788bee56ba4cf7522801270152da5209d7
_rev=d71d54788
pkgver=2.2.0.${_rev}
pkgrel=5
pkgdesc="Fast Artificial Neural Network Library"
url="https://github.com/${pkgname}/${_origname}"
arch=('i686' 'x86_64' 'armv7h')
license=('LGPLv2.1')
depends=('glibc')
makedepends=('git' 'gcc' 'cmake' 'make' 'coreutils')
source=(${pkgname}-${pkgver}.zip::https://github.com/${pkgname}/${_origname}/archive/${_fullrev}.zip)

sha256sums=('a456c8703de30734317549ba26e7c574f56edbc7964d23f3ffe0bcd51c3297d6')

build() {
	cd "${srcdir}/${_origname}-${_fullrev}"

	mkdir -p build
	cd build
	cmake -DCMAKE_INSTALL_PREFIX=${pkgdir}/usr ..

	make -j$(nproc)
}

package() {
	cd "${srcdir}/${_origname}-${_fullrev}/build"

	make install
}

