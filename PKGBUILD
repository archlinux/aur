# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=git-tree-app
_gitname=gittree
_appname=git-tree
pkgname=${_appname}-bin
pkgdesc="Local-first visual Git client for macOS, Windows and Linux"

pkgver=3.0.4
pkgrel=1
_gitversion=v${pkgver}

arch=('x86_64')

_ghurl="https://github.com/${_gitauthor}/${_gitname}"
_ghurlraw="https://raw.githubusercontent.com/${_gitauthor}/${_gitname}/${_gitversion}"
url="https://gittree.app"

license=('Apache-2.0')

provides=("${_appname//-/}")
conflicts=("${pkgname%-bin}")

depends=('glibc' 'libgcc')

options=('!strip')

source_x86_64=("${_appname}-${arch[0]}-${pkgver}.deb::${_ghurl}/releases/download/${_gitversion}/Git-Tree-Linux.deb")
sha256sums_x86_64=('7ce94bd5362804d8b7578be6dcb9a7955923e4778f45f044cc4f162b1e1c92c4')


package() {
	cd "${pkgdir}"

	tar -xf "${srcdir}/data.tar.gz"
}
