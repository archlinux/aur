# Maintainer: kleintux <reg-archlinux AT klein DOT tuxli DOT ch> 

_pkgname=raceintospace
pkgname=${_pkgname}-git
pkgver=r1582.0b63a34
pkgrel=1
pkgdesc='The computer version of the Liftoff! board game by Fritz Bronner'
arch=('any')
url='https://www.raceintospace.org/'
license=('GPL2')
depends=('sdl' 'libvorbis' 'libtheora' 'boost' 'libogg' 'libpng' 'jsoncpp' 'zlib')
makedepends=('git' 'cmake' 'protobuf' 'cereal' 'physfs')
conflicts=(${_pkgname})
source=("git+https://github.com/${_pkgname}/${_pkgname}.git")
md5sums=('SKIP')

pkgver() {
	cd "${_pkgname}"
 	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd ${srcdir}/${_pkgname}
	cmake .
}

package()
{
	cd ${srcdir}/${_pkgname}
	make DESTDIR=${pkgdir} install
}
