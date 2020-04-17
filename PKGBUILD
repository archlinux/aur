# Maintainer: TBK <aur at jjtc dot eu>
# Contributor: TBK <aur at jjtc dot eu>

pkgname=libqtolm
pkgver=3.0.1
pkgrel=3
pkgdesc='A Qt wrapper for libolm'
url='https://gitlab.com/b0/libQtOlm'
arch=('x86_64')
license=('GPL-3.0-or-later')
depends=('qt5-base' 'libolm')
conflicts=('libqtolm-git')
replaces=('libqtolm-git')
makedepends=('cmake')
source=("https://gitlab.com/b0/libQtOlm/-/archive/v$pkgver/libqtolm-v$pkgver.tar.gz")
sha512sums=('98ee8f1a9f69e6e78105e9deb651d276de79678f749d43ae506295d59500617ce517338894a96a163e6d2de901413d6200bb788b507a6ad9179e1cbdc682a858')
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
