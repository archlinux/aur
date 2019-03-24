# Maintainer: oi_wtf <brainpower at mailbox dot org>

pkgname=bp-nfoview
pkgver=0.2.7
pkgrel=1
pkgdesc="A Simple NFO-Viewer by brainpower"
arch=('i686' 'x86_64')
url="https://github.com/brainpower/bp-nfoview"
license=('GPL')
depends=('qt5-base')
makedepends=('meson' 'git' 'qt5-tools')
source=("https://github.com/brainpower/bp-nfoview/archive/v${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('af1f759a437346b0c92f1b0680ecf853f5a8f76b02079c0155c547763d5cde49')

build(){
	cd "${srcdir}/${pkgname}-${pkgver}"

	arch-meson builddir

	ninja -C builddir
}

package(){
	cd "${srcdir}/${pkgname}-${pkgver}/builddir"

	DESTDIR="${pkgdir}" ninja install
}
