# Maintainer: oi_wtf <brainpower at mailbox dot org>

pkgname=bp-nfoview
pkgver=0.2.6
pkgrel=1
pkgdesc="A Simple NFO-Viewer by brainpower"
arch=('i686' 'x86_64')
url="https://github.com/brainpower/bp-nfoview"
license=('GPL')
depends=('qt5-base')
makedepends=('meson' 'git')
source=("https://github.com/brainpower/bp-nfoview/archive/v${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('5a5606a7ae21f1518b2c56e957e3842b9778930d69849c5a5405ed403a214ab2')

build(){
	cd "${srcdir}/${pkgname}-${pkgver}"

	arch-meson builddir

	ninja -v -C builddir
}

package(){
	cd "${srcdir}/${pkgname}-${pkgver}/builddir"

	DESTDIR="${pkgdir}" ninja install
}
