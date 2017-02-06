# Contributor: Bernhard Walle <bernhard@bwalle.de>
# Contributor: Clovis Fabricio <arch.nosklo@0sg.net>
# Contributor: Christopher Krooß <c.krooss@gmail.com>
# Maintainer: Andre Klitzing <aklitzing () gmail () com>
# AUR Category: devel

pkgname=tortoisehg
pkgver=4.0.2
pkgrel=2
pkgdesc="Graphical tools for Mercurial"
url="http://tortoisehg.bitbucket.org/"
license=("GPL")
depends=('python2' 'mercurial>=4.0' 'python2-pyqt4>=4.10' 'python2-qscintilla' 'python2-iniparse')
builddepends=(python2)
arch=('any')
optdepends=('python2-pygments: syntax highlighting'
	    'python2-nautilus: Python binding for Nautilus components')
source=("https://bitbucket.org/tortoisehg/thg/get/64cd46deba83a8998b799d4a5ef452ead2087d59.tar.gz")
#source=("http://bitbucket.org/tortoisehg/targz/downloads/${pkgname}-${pkgver}.tar.gz")

package() {
	#cd "${srcdir}/${pkgname}-${pkgver}"
	cd "${srcdir}/tortoisehg-thg-64cd46deba83"

	python2 setup.py install --prefix=/usr --root="${pkgdir}"
	install -Dm 644 "contrib/mergetools.rc" "${pkgdir}/etc/mercurial/hgrc.d/thgmergetools.rc"
	install -Dm 644 "contrib/thg.desktop" "${pkgdir}/usr/share/applications/thg.desktop"
	install -Dm 644 "icons/svg/thg_logo.svg" "${pkgdir}/usr/share/pixmaps/thg_logo.svg"

	# already provided by hg 4.0
	rm "${pkgdir}/usr/lib/python2.7/site-packages/hgext3rd/__init__.py"
	rm "${pkgdir}/usr/lib/python2.7/site-packages/hgext3rd/__init__.pyc"
}

sha256sums=('04f1935eb8e8325ab5c760ced66d07d1024064e8fe1766819799d2b6621c60ca')
