# Contributor: Bernhard Walle <bernhard@bwalle.de>
# Contributor: Clovis Fabricio <arch.nosklo@0sg.net>
# Contributor: Christopher Krooß <c.krooss@gmail.com>
# Maintainer: Andre Klitzing <aklitzing () gmail () com>
# AUR Category: devel

pkgname=tortoisehg
pkgver=3.4.2
pkgrel=1
pkgdesc="Graphical tools for Mercurial"
url="http://tortoisehg.bitbucket.org/"
license="GPL"
depends=('python2' 'mercurial>=3.3' 'python2-pyqt4>=4.10' 'python2-qscintilla' 'python2-iniparse')
builddepends=(python2)
arch=('any')
optdepends=('python2-pygments: syntax highlighting'
	    'python2-nautilus: Python binding for Nautilus components')
source=("http://bitbucket.org/tortoisehg/targz/downloads/${pkgname}-${pkgver}.tar.gz")

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"

	python2 setup.py install --prefix=/usr --root="${pkgdir}"
	install -Dm 644 "contrib/mergetools.rc" "${pkgdir}/etc/mercurial/hgrc.d/thgmergetools.rc"
	install -Dm 644 "contrib/thg.desktop" "${pkgdir}/usr/share/applications/thg.desktop"
	install -Dm 644 "icons/scalable/apps/thg-logo.svg" "${pkgdir}/usr/share/pixmaps/thg_logo.svg"
}

sha256sums=('d22692166dc6ff61c9d12bfe5ceb77fbf87e7dd52222c956976e7987d84145a1')
