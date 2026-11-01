# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=git-tree-app
_gitname=gittree
_appname=git-tree
pkgname=${_appname}-bin
pkgdesc="Local-first visual Git client for macOS, Windows and Linux"

pkgver=2.2.7
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
sha256sums_x86_64=('8e83f717fa54a26cc50195499a63c4209040fe04e3d47d77f1dc6c02663e78d3')


package() {
	cd "${pkgdir}"

	tar -xf "${srcdir}/data.tar.gz"
}
