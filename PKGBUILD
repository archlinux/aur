# Maintainer: Drew DeVault <sir@cmpwn.com>
pkgname=patchrom
pkgver=1.1.2
pkgrel=1
license=('MIT')
pkgdesc='Patches jump tables into ROM dumps'
makedepends=("cmake" "asciidoc")
arch=("i386" "x86_64")
url='https://github.com/KnightOS/patchrom'
source=("https://github.com/KnightOS/patchrom/archive/${pkgver}.tar.gz")
sha1sums=('266747516f98df8b7ec2edcebd7bf5aa35a4df50')

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"

	cmake . -DCMAKE_INSTALL_PREFIX=/usr
	make
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"

	DESTDIR="$pkgdir/" make install
}
