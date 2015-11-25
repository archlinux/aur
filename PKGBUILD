# Contributor: Sebastian Wolf <fatmike303 at googlemail dot com>
pkgname=yape
pkgver=0.58.2
pkgrel=1
_projectname=yapesdl
_git_hash=f34a47a03051263df0f27a2b19350f2b0848d85c
pkgdesc='A decent multiplatform Commodore plus/4 and 64 emulator written in C++ using the SDL 2.0 media API'
arch=('i686' 'x86_64')
url='http://yapesdl.codeplex.com'
license='GPL'
depends=('sdl2')
source=(${_projectname}::git+https://git01.codeplex.com/${_projectname})
md5sums=(SKIP)

build() {
    cd ${srcdir}/${_projectname}
	git reset --hard ${_git_hash}
	make
}

package() {
	install -Dm755 ${srcdir}/${_projectname}/${_projectname} ${pkgdir}/usr/bin/${pkgname}
}
