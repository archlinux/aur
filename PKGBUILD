# Maintainer: Tom Nguyen <tom81094@gmail.com>
# Contributor: Antergos Developers <dev@antergos.com>

pkgname=mediawriter
_pkgname=MediaWriter
_author=MartinBriza
pkgver=4.1.1
pkgrel=2
pkgdesc='Fedora Media Writer is a tool that helps users put Fedora (and custom) images on their portable drives such as flash disks.'
arch=('any')
url="https://github.com/${_author}/${_pkgname}"
license=('GPL2')
depends=('xz' 'qt5-base' 'qt5-imageformats' 'qt5-tools' 'qt5-declarative' 'qt5-graphicaleffects' 'qt5-svg' 'qt5-quickcontrols')
optdepends=('udisks2: Disk Management Service for disk installation' 'storaged: LVM DBus add-on for udisks for disk installation')
makedepends=('transifex-client')
source=("https://github.com/${_author}/${_pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('91e92f28915eb344e1117dd2db613dbc9eeb389b578920607c3e5ea2191aa261')

build() {
	cd "${_pkgname}-${pkgver}"

	INSTALL_ROOT="${pkgdir}" qmake-qt5 PREFIX=/usr .
	make ${MAKEFLAGS}
}


package() {
	cd "${_pkgname}-${pkgver}"

	INSTALL_ROOT="${pkgdir}" make ${MAKEFLAGS} install
}
