# Maintainer: hashworks <mail@hashworks.net>
pkgname=zimwriterfs
pkgver=1.2
pkgrel=1
pkgdesc="A tool for creating ZIM files based on contents on a local filesystem"
license=('GPL3')
arch=('any')
depends=('libzim' 'gumbo-git' 'xapian-core')
makedepends=('meson')
url='https://github.com/openzim/zimwriterfs'
source=("https://github.com/openzim/zimwriterfs/archive/${pkgver}.tar.gz")
sha256sums=(15ab3796a78dd8de9334345ad1838372ab88d0cbd908ab92055efbd9b5d6278e)

build() {
	cd "${pkgname}-${pkgver}"
	echo "$(pwd)"
	arch-meson build -Dwerror=false
	ninja -C build
}

package() {
	cd "${pkgname}-${pkgver}/build"
	DESTDIR="${pkgdir}" ninja install
}
