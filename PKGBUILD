# Maintainer: TBK <aur at jjtc dot eu>
# Contributor: TBK <aur at jjtc dot eu>

pkgname=libqtolm
pkgver=3.0.1
pkgrel=2
pkgdesc='A Qt wrapper for libolm'
url='https://gitlab.com/b0/libQtOlm'
arch=('any')
license=('GPL-3.0-or-later')
depends=('qt5-base' 'libolm')
conflicts=('libqtolm-git')
replaces=('libqtolm-git')
makedepends=('cmake')
source=("https://gitlab.com/b0/libQtOlm/-/archive/v$pkgver/libqtolm-v$pkgver.tar.gz")
sha256sums=('b7de94f3e3232d9b0307eaa4ae4fc8df2996f1968bef4750a52791a171edc09e')
_builddir="$pkgname-v$pkgver"

build() {
    cd "$_builddir"
	cmake -B build \
		-DCMAKE_BUILD_TYPE=None \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DCMAKE_INSTALL_LIBDIR=lib \
		-DBUILD_SHARED_LIBS=True
	make -C build
}

package() {
    cd "$_builddir"
	make -C build DESTDIR="$pkgdir" install
}
