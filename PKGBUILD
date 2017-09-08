# Maintainer: Tom Nguyen <tom81094@gmail.com>
# Contributor: Antergos Developers <dev@antergos.com>

pkgname=mediawriter
_pkgname=MediaWriter
_author=MartinBriza
pkgver=4.1.0
pkgrel=3
pkgdesc='Fedora Media Writer is a tool that helps users put Fedora (and custom) images on their portable drives such as flash disks.'
arch=('x86_64')
url="https://github.com/${_author}/${_pkgname}"
license=('GPL2')
depends=('qt5-base' 'qt5-imageformats' 'qt5-tools' 'qt5-declarative' 'qt5-graphicaleffects' 'qt5-svg' 'qt5-quickcontrols')
makedepends=('transifex-client')
source=("https://github.com/${_author}/${_pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('18003b21dfb966d186c10fdddf92581f0576c5cabfe080daf16d4d98cb23b147')

build() {
	cd "${_pkgname}-${pkgver}"

	INSTALL_ROOT="${pkgdir}" qmake-qt5 PREFIX=/usr .
	make
}


package() {
	cd "${_pkgname}-${pkgver}"

	INSTALL_ROOT="${pkgdir}" make install
}
