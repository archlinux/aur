# Maintainer: Paul Dunn <pwjdunn AT gmail DOT com>

pkgname=brouwhulp-bin
pkgver=5.3.4.3
pkgrel=1
pkgdesc="Dutch beer-brewing tool with recipes"
arch=('x86_64' 'i686')
license=()
url="https://www.twortwat.nl/brouwhulp"
options=()
source_x86_64=("brouwhulp::https://www.dropbox.com/s/qfineogud1vf8ls/brouwhulp_5.3.4.3_amd64.deb?dl=1")
md5sums_x86_64=('SKIP')
source_i686=("brouwhulp::https://www.dropbox.com/s/r3ww8jsvat8rq68/brouwhulp_5.3.4.3_i386.deb?dl=1")
md5sums_i686=('SKIP')
makedepends=('xz')
depends=('qt4pas' 'fann')
optdepends=('lib32-qt4pas')
install="${pkgname}.install"
package() {
	cd "${srcdir}"
	ar x brouwhulp
	xz -d "${srcdir}"/data.tar.xz
	tar -xf "${srcdir}/data.tar"
	cp -dr --no-preserve=ownership ${srcdir}/usr ${pkgdir}/usr
}
