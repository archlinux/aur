# Maintainer: Xavion <Xavion (dot) 0 (at) Gmail (dot) com>
# Contributor: Evgeniy Alekseev <arcanis at archlinux dot org>
# Contributor: Ray Rashif <schiv at archlinux dot org>
# Contributor: Brad Fanella <bradfanellaat archlinux dot us>
# See .contrib for older/other contributors

pkgname=eric
pkgver=21.1
pkgrel=1
pkgdesc="A full-featured Python and Ruby IDE in PyQt"
arch=('any')
url="https://${pkgname}-ide.python-projects.org/"
license=('GPL3')
depends=('python-qscintilla-qt5' 'python-pyqt5-webengine' 'python-pyqt5-chart' 'qt5-svg')
conflicts=(${pkgname}-common)
replaces=(${pkgname}-common)
source=("https://downloads.sourceforge.net/${pkgname}-ide/${pkgname}6-${pkgver}.tar.gz")

package_eric() {
	cd "${pkgname}6-${pkgver}"

	python install.py -c -b "/usr/bin" -i "${pkgdir}"

	# fix paths in desktop files
	find "${pkgdir}" -name '*.desktop' -exec sed -i "s|${pkgdir}||g" {} \;
}

sha256sums=('6ae88796caa17ec6bc32165614372c052e409e7f2467d7d8a93a1f0b2bbded0f')
