# Maintainer: oi_wtf <brainpower at mailbox dot org>

pkgname=bp-nfoview
pkgver=0.3.1
pkgrel=1
pkgdesc="A Simple NFO-Viewer by brainpower"
arch=('x86_64')
url="https://github.com/brainpower/bp-nfoview"
license=('GPL')
depends=('qt5-base')
makedepends=('meson' 'qt5-tools')
source=("https://github.com/brainpower/bp-nfoview/archive/v${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('c42bef0657d45983f2a8f0e9dd8509a5e8e19adfe8494e069c5e9d62a850a8c3')

build(){
	cd "${srcdir}/${pkgname}-${pkgver}"

	arch-meson builddir

	ninja -C builddir
}

package(){
	cd "${srcdir}/${pkgname}-${pkgver}/builddir"

	DESTDIR="${pkgdir}" ninja install
}
