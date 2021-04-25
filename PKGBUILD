# Maintainer: oi_wtf <brainpower at mailbox dot org>

pkgname=bp-nfoview
pkgver=0.3.0
pkgrel=1
pkgdesc="A Simple NFO-Viewer by brainpower"
arch=('x86_64')
url="https://github.com/brainpower/bp-nfoview"
license=('GPL')
depends=('qt5-base')
makedepends=('meson' 'qt5-tools')
source=("https://github.com/brainpower/bp-nfoview/archive/v${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('a6df2ca98cffcd2706cf0950073b8672a6b8d944b95f3a564c48d5f3f2486146')

build(){
	cd "${srcdir}/${pkgname}-${pkgver}"

	arch-meson builddir

	ninja -C builddir
}

package(){
	cd "${srcdir}/${pkgname}-${pkgver}/builddir"

	DESTDIR="${pkgdir}" ninja install
}
