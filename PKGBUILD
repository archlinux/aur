# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=git-tree-app
_gitname=gittree
_appname=git-tree
pkgname=${_appname}-bin
pkgdesc="Local-first visual Git client for macOS, Windows and Linux"

pkgver=3.0.6
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
sha256sums_x86_64=('a29a2fb4a8655f54ae1db512da529dbb44e80380b2a155d2d144cfe6c3449403')


package() {
	cd "${pkgdir}"

	tar -xf "${srcdir}/data.tar.gz"
}
