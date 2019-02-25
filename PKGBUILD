# Maintainer: Drew DeVault <sir@cmpwn.com>
pkgname=genkfs
pkgver=1.2.2
pkgrel=1
license=('MIT')
pkgdesc='Builds KFS filesystems for KnightOS'
makedepends=("cmake" "asciidoc")
arch=("i386" "x86_64")
url='https://github.com/KnightOS/genkfs'
source=("https://github.com/KnightOS/genkfs/archive/${pkgver}.tar.gz")
sha256sums=('93690989819ee93dd5130b2761879deaa3d70c706b050bd31eb8d5997cb683e8')

build() {
	cd "$pkgname-$pkgver"
	cmake . -DCMAKE_INSTALL_PREFIX=/usr
	make
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	DESTDIR="$pkgdir/" make install
}
